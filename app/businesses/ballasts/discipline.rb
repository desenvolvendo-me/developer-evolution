module Ballasts
  class Discipline < BusinessApplication
    attr_accessor :time_available

    WEEK = 7
    MICRO_GOAL = 14
    GOAL = 90
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
          goal: last_goal_sum,
          micro_goal: last_micro_goal_sum,
          week: last_week_sum,
          day: last_day
        }
      }
    end

    private

    def last_day
      number = @student.practices.last.commit_total
      icon = (number >= calculate_min_commits) ? ICON_OK : ICON_NOK
      { number: number, icon: icon }
    end

    def last_week_sum
      last_period_sum(WEEK, calculate_min_commits)
    end

    def last_micro_goal_sum
      last_period_sum(MICRO_GOAL, calculate_min_commits)
    end

    def last_goal_sum
      last_period_sum(GOAL, calculate_min_commits)
    end

    def calculation_period(period_type)
      today = Date.today
      finish_period = today - (today.wday + 1) % 7
      start_period = finish_period - period_type
      [finish_period, start_period]
    end

    def last_period_sum(period_type, limit)
      finish_period, start_period = calculation_period(period_type - 1)

      if period_type.eql? GOAL
        @practices = @student.practices.where(commit_date: (start_period..finish_period)).to_a
      else
        @practices = @practices.select { |practice| practice.commit_date.between?(start_period, finish_period) }
      end

      number = @practices.to_a.map(&:commit_total).sum
      icon = (number >= limit * period_type) ? ICON_OK : ICON_NOK
      { number: number, icon: icon }
    end

    def calculate_min_commits
      (@student.time_available / 2.0 * 3).ceil
    end
  end
end