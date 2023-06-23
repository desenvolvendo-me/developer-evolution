class Scrapings::Github
  def initialize(args = { resource: nil })
    @student = args[:resource]
    @final_enrollment_date = args[:final_enrollment_date]
  end

  def pull_commits
    read_document
    total_contributions
    average_contributions
  end

  def total_contributions
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

    @student.update(github_commit_total: @student.practices.sum(:commit_total))
  end

  def average_contributions
    start_date_practice = @student.enrollment_date
    final_date_practice = @final_enrollment_date.present? ? @final_enrollment_date : Date.today
    days_total = (final_date_practice - start_date_practice).to_i + 1
    commit_total = @student.practices.where(commit_date: start_date_practice..final_date_practice).sum(:commit_total)
    commit_average = commit_total / days_total

    @student.update(github_commit_average: commit_average)
  end

  private

  def read_document
    year = @student.enrollment_date.year
    url = "#{@student.github_link}?tab=overview&from=#{year}-12-01&to=#{year}-12-31"
    response = HTTParty.get(url)
    @document = Nokogiri::HTML(response.body)
  end

end