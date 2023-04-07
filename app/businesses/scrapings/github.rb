class Scrapings::Github
  def initialize(args = { resource: nil })
    @student = args[:resource]
    year = @student.enrollment_date.year
    url = "#{@student.github_link}?tab=overview&from=#{year}-12-01&to=#{year}-12-31"
    response = HTTParty.get(url)
    @document = Nokogiri::HTML(response.body)
  end

  def download
    contributions = get_contributions
    @student.update(github_commit: contributions.inject(0) { |sum, x| sum + x[:commits] })
  end

  def get_contributions
    contributions = []
    @document.search("div.js-calendar-graph").each do |element|
      element.text.split("\n").delete_if { |s| s.blank? }.each do |contribuition|
        next if contribuition.strip.include?("No ")
        next if contribuition.strip.include?("Learn ")
        next unless contribuition.strip.include?("contribution")

        contribuition_clean = contribuition.strip
        contribuition_params = contribuition_clean.split(",")
        contribuition_date = (contribuition_params[1].strip + " " + contribuition_params[2].strip).to_date
        contribuition_commit = contribuition_params[0].split(" ")[0]
        contributions.push({ date: contribuition_date, commits: contribuition_commit.to_i })
      end
    end
    contributions
  end

end