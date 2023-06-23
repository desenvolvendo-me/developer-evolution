class Scrapings::Wakatime
  def initialize(args = { resource: nil })
    @student = args[:resource]
    @final_enrollment_date = args[:final_enrollment_date]
  end

  def pull_activities
    read_document
    total_activities
    average_activities
  end

  def total_activities
    @document.search("rect").each do |element|
      next if element.text.blank?

      activity_total, activity_date = element.text.split(" on ")

      @student.practices << Practice.new(activity_total: convert_activity_to_second(activity_total), activity_date: activity_date.to_date)
    end

    @student.update(wakatime_activity_total: @student.practices.sum(:activity_total))
  end

  def average_activities
    start_date_practice = @student.enrollment_date
    final_date_practice = @final_enrollment_date.present? ? @final_enrollment_date : Date.today
    days_total = (final_date_practice - start_date_practice).to_i + 1
    commit_total = @student.practices.where(activity_date: start_date_practice..final_date_practice).sum(:activity_total)
    commit_average = commit_total / days_total

    @student.update(wakatime_activity_average: commit_average)
  end

  private

  def read_document
    browser = Watir::Browser.new
    browser.goto @student.wakatime_link
    js_doc = browser.element(class: 'insight-data').wait_until(&:present?)
    @document = Nokogiri::HTML(js_doc.inner_html)
  end

  def convert_activity_to_second(activity_total)
    parts = activity_total.split(" ")

    seconds = 0

    parts.each do |part|
      if part.include?("s")
        seconds += part.to_i
      elsif part.include?("m")
        seconds += part.to_i * 60
      elsif part.include?("h")
        seconds += part.to_i * 3600
      end
    end

    seconds
  end

end