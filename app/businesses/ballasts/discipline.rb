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
          week: last_week_sum,
          micro_goal: 33,
          goal: 1234
        }
      }
    end

    private

    def last_day
      number = @student.practices.last.commit_total
      #TODO: O número 3 será substituído por um cálculo de tempo disponível
      (number >= 3) ? icon = "heart" : icon = "heart-broken"
      { number: number, icon: icon }
    end

    def last_week_sum
      today = Date.today
      last_saturday = today - (today.wday + 1) % 7
      sunday_before_saturday = last_saturday - 6

      practices = @student.practices.where(commit_date: (sunday_before_saturday..last_saturday))

      number = practices.sum(:commit_total)
      icon = number >= 21 ? 'heart' : 'heart-broken'
      { number: number, icon: icon }
    end

  end
end