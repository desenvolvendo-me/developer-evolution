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
          goal: last_goal_sum,
          micro_goal: last_micro_goal_sum,
          week: last_week_sum,
          day: last_day,
          micro_goal_compared: micro_goal_compared
        }
      }
    end

    def calculate_min_commits
      ultradian_cycle = 2.0
      min_commit_day = 3
      (@student.time_available / ultradian_cycle * min_commit_day).ceil
    end

    private

    def last_day
      practice = @student.practices.last
      number = practice.commit_total
      icon = practice.success? ? ICON_OK : ICON_NOK
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
      # TODO: Alterar futuramente, quando Deus permitir.
      # O cálculo do período é baseada na data de inscrição para saber a micro meta corrente.
      # Isso gerar uma semana de erro no cálculo

      today = Date.today
      finish_period = today - (today.wday + 1) % 7
      start_period = finish_period - period_type
      [finish_period, start_period]
    end

    def last_period_sum(period_type, limit)
      finish_period, start_period = calculation_period(period_type - 1)

      if period_type.eql? GOAL
        @practices = @student.practices.where(commit_date: (start_period..finish_period))
      else
        @practices_per_period = @practices.to_a.select { |practice| practice.commit_date.between?(start_period, finish_period) }
      end

      number = @practices_per_period.to_a.map(&:commit_total).sum
      icon = (number >= limit * period_type) ? ICON_OK : ICON_NOK
      { number: number, icon: icon }
    end

    def micro_goal_compared
      finish_period, start_period = calculation_period((MICRO_GOAL * 2) - 1)

      @two_lasts_micro_goal = @practices.to_a.select { |practice| practice.commit_date.between?(start_period, finish_period) }

      number_micro_goal1 = @two_lasts_micro_goal.to_a.in_groups(2).first.compact.map(&:commit_total).sum
      number_micro_goal2 = @two_lasts_micro_goal.to_a.in_groups(2).last.compact.map(&:commit_total).sum

      evolution = ((number_micro_goal2.to_f - number_micro_goal1.to_f) / number_micro_goal1.to_f) * 100

      evolution.round(2)
    end
  end
end