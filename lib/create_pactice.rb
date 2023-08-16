class CreatePactice
  def for_days(num_days, commit_total, student)
    (0..num_days - 1).each do |days_ago|
      commit_date = Date.today - (num_days - days_ago)
      Practice.create(commit_date: commit_date, commit_total: commit_total, student: student)
    end
  end
end