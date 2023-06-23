class Scrapings::Wakatime
  def initialize(args = { resource: nil })
    @student = args[:resource]
    @final_enrollment_date = args[:final_enrollment_date]
  end

  def pull_activities
    read_document
    total_contributions
  end

  def total_contributions
    @document.search("rect").each do |element|
      next if element.text.blank?

      activity_total, activity_date = element.text.split(" on ")

      @student.practices << Practice.new(activity_total: convert_activity_to_second(activity_total), activity_date: activity_date.to_date)
    end

    @student.update(wakatime_activity_total: @student.practices.sum(:activity_total))
  end

  private

  def read_document
    browser = Watir::Browser.new
    browser.goto @student.wakatime_link
    js_doc = browser.element(class: 'insight-data').wait_until(&:present?)
    @document = Nokogiri::HTML(js_doc.inner_html)
  end

  def convert_activity_to_second(activity_total)
    puts activity_total
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