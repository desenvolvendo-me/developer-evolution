module Profiles
  class Potential < BusinessApplication
    LEVEL_POTENTIAL = "undefined"

    def initialize(**params)
      @params = params
      @student = @params[:resource]
    end

    def call
      Profiles::Level.call({ resource: @student })
      Intensities::Github.call({ resource: @student })
      Intensities::Wakatime.call({ resource: @student })
      Intensities::Linkedin.call({ resource: @student })

      Potentials::Low.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::Medium.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::High.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::NotStarted.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::GaveUpCareer.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::GaveUpMentoring.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::AlmostGoal.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::Goal.call({ resource: @student, level_potential: LEVEL_POTENTIAL })
      Potentials::NoTestimony.call({ resource: @student, level_potential: LEVEL_POTENTIAL })

      @student.save
    end

  end
end