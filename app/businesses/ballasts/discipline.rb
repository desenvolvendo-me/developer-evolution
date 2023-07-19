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
          day: last_day,
          week: last_week_average,
          micro_goal: 33,
          goal: 1234
        }
      }
    end

    private

    def last_day
      number = @student.practices.last.commit_total

      if number >= 3
        icon = "heart"
      else
        icon = "heart-broken"
      end

      {
        number: number,
        icon: icon
      }
    end

    def last_week_average
      today = Date.today
      sunday = today - today.wday

      practices = @student.practices.where('commit_date >= ?', sunday)

      practices.sum(:commit_total)
    end

  end
end