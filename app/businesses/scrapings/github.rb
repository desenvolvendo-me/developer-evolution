class Scrapings::Github
  def initialize(args = { resource: nil })
    @student = args[:resource]
  end

  def download
    read_document
    get_contributions
  end

  def get_contributions
    @document.search("div.js-calendar-graph").each do |element|
      element.text.split("\n").delete_if { |s| s.blank? }.each do |contribution|
        next if contribution.strip.include?("Learn ")
        next unless contribution.strip.include?("contribution")

        contribution_clean = contribution.strip
        contribution_params = contribution_clean.split(",")
        contribution_date = (contribution_params[1].strip + " " + contribution_params[2].strip).to_date
        contribution_commit = contribution_params[0].split(" ")[0]

        @student.practices << Practice.new(commit_total: contribution_commit.to_i, commit_date: contribution_date)
      end
    end

    @student.update(github_commit: @student.practices.sum(:commit_total))
  end

  private

  def read_document
    year = @student.enrollment_date.year
    url = "#{@student.github_link}?tab=overview&from=#{year}-12-01&to=#{year}-12-31"
    response = HTTParty.get(url)
    @document = Nokogiri::HTML(response.body)
  end

end