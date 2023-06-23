module Scrapings
  class Wakatime
    attr_reader :student, :final_enrollment_date

    def initialize(args = {})
      @student = args[:resource]
      @final_enrollment_date = args[:final_enrollment_date]
    end

    def pull_activities
      document = read_document
      total_activities(document)
      average_activities
    end

    private

    def total_activities(document)
      document.search("rect").each do |element|
        next if element.text.strip.empty?

        activity_total, activity_date = element.text.split(" on ")
        student.practices << Practice.new(activity_total: convert_activity_to_seconds(activity_total), activity_date: activity_date.to_date)
      end

      student.update(wakatime_activity_total: student.practices.sum(:activity_total))
    end

    def average_activities
      start_date_practice = student.enrollment_date
      final_date_practice = final_enrollment_date || Date.today
      days_total = (final_date_practice - start_date_practice).to_i + 1
      commit_total = student.practices.where(activity_date: start_date_practice..final_date_practice).sum(:activity_total)
      commit_average = commit_total / days_total

      student.update(wakatime_activity_average: commit_average)
    end

    def read_document
      browser = Watir::Browser.new
      browser.goto student.wakatime_link
      js_doc = browser.element(class: 'insight-data').wait_until(&:present?)
      Nokogiri::HTML(js_doc.inner_html)
    end

    def convert_activity_to_seconds(activity_total)
      time_units = { "s" => 1, "m" => 60, "h" => 3600 }

      seconds = 0
      activity_total.split(" ").each do |part|
        unit = time_units[part[-1]]
        seconds += part.to_i * unit
      end
      seconds
    end
  end
end
