module Ballasts
  class Discipline < BusinessApplication

    WEEK = 6
    MICRO_GOAL = 13
    GOAL = 90
    DAY_LIMIT = 3
    WEEK_LIMIT = 21
    MICRO_GOAL_LIMIT = 42
    GOAL_LIMIT = 252
    ICON_OK = "heart"
    ICON_NOK = "heart-broken"

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
          micro_goal: last_micro_goal_sum,
          goal: last_goal_sum
        }
      }
    end

    private

    def last_day
      number = @student.practices.last.commit_total
      icon = (number >= DAY_LIMIT) ? ICON_OK : ICON_NOK
      { number: number, icon: icon }
    end

    def last_week_sum
      last_period_sum(WEEK, WEEK_LIMIT)
    end

    def last_micro_goal_sum
      last_period_sum(MICRO_GOAL, MICRO_GOAL_LIMIT)
    end

    def last_goal_sum
      last_period_sum(GOAL, GOAL_LIMIT)
    end

    def calculation_period(period_type)
      today = Date.today
      finish_period = today - (today.wday + 1) % 7
      start_period = finish_period - period_type
      [finish_period, start_period]
    end

    def last_period_sum(period_type, limit)
      finish_period, start_period = calculation_period(period_type)

      practices = @student.practices.where(commit_date: (start_period..finish_period))

      number = practices.sum(:commit_total)
      icon = (number >= limit) ? ICON_OK : ICON_NOK
      { number: number, icon: icon }
    end

  end
end