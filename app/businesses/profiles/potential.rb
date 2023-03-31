module Profiles
  class Potential < BusinessApplication
    LEVEL_POTENTIAL = "undefined"

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      Profiles::Level.call({ resource: @student })
      Intensity::Github.call({ resource: @student })
      Intensity::Wakatime.call({ resource: @student })
      Intensity::Linkedin.call({ resource: @student })

      Potentials::Low.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::Medium.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::High.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::NotStarted.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::GaveUpCareer.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::GaveUpMentoring.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::AlmostGoal.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::Goal.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::NoTestimony.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
    end

  end
end