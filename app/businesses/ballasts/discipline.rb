module Ballasts
  class Discipline < BusinessApplication

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      {
        chart: {
          labels: [
            "Micro Goal 1",
            "Micro Goal 2",
            "Micro Goal 3",
            "Micro Goal 4",
            "Micro Goal 5",
            "Micro Goal 6"
          ],
          datasets: [
            {
              label: "Goal",
              fill: false,
              backgroundColor: "#3cb371",
              borderColor: "#3cb371",
              data: [196, 223, 148, 273, 279, 315],
            },
          ],
        },
        stats: {
          micro_goal_compared: 23,
          day: day_average,
          week: 14,
          micro_goal: 33,
          goal: 1234
        }
      }
    end

    private

    def day_average
      practices = @student.practices.where('commit_date >= ?', @student.enrollment_date)

      practices_total = practices.count
      commits = practices.sum(:commit_total)
      commits / practices_total
    end

  end
end