ActiveAdmin.register Student do
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :name
    column :class_description
    column :enrollment_duration do |student|
      (Date.today - student.enrollment_date).to_i / 30
    end
    column :class_progress
    column :meeting_situation
    column :level_number
    column :level_potential
    actions
  end

  show title: proc { |p| "Estudante: " + p.name } do
    attributes_table title: "Básico" do
      row :name
      row :class_description
      row :enrollment_date do |student|
        student.enrollment_date.strftime("%d/%m/%Y")
      end
    end

    attributes_table title: "Progresso" do
      row :enrollment_duration do |student|
        (Date.today - student.enrollment_date).to_i / 30
      end
      row :profile_hotmart do |student|
        link_to "Hotmart", student.profile_hotmart, target: "_blank"
      end
      row :profile_discord do |student|
        link_to "Discord", student.profile_discord, target: "_blank"
      end
      row :level_number
      row :level_potential
      row :level_testimony
      row :class_progress
    end

    attributes_table title: "Mentoria Individual" do
      row :meeting_situation
      row :meeting_last
      row :meeting_next do |student|
        student.meeting_last + 1.months
      end
      row :meeting_number
      row :meeting_link do |student|
        link_to "Meeting Link", student.meeting_link, target: "_blank"
      end
    end

    attributes_table title: "Avaliação Social" do
      row :github_link do |student|
        link_to "Github Link", student.github_link, target: "_blank"
      end
      row :github_intensity
      row :wakatime_link do |student|
        link_to "Wakatime Link", student.wakatime_link, target: "_blank"
      end
      row :wakatime_activity_average
      row :wakatime_intensity
      row :linkedin_link do |student|
        link_to "Linkedin Link", student.linkedin_link, target: "_blank"
      end
      row :linkedin_followers
      row :linkedin_post_last_month
      row :linkedin_intensity
    end

    attributes_table title: "Avaliação Método" do
      row :challenge
      row :mission_future do |student|
        link_to "Mission Future", student.mission_future, target: "_blank"
      end
      row :mission_future do |student|
        link_to "Mission Future Generator", student.mission_future_generator, target: "_blank"
      end
      row :mission_future_point
      row :mission_base do |student|
        link_to "Mission Base", student.mission_base, target: "_blank"
      end
      row :mission_base do |student|
        link_to "Mission Base Generator", student.mission_base_generator, target: "_blank"
      end
      row :mission_base_point
      row :mission_vacancy do |student|
        link_to "Mission Vacancy", student.mission_vacancy, target: "_blank"
      end
      row :mission_vacancy do |student|
        link_to "Mission Vacancy Generator", student.mission_vacancy_generator, target: "_blank"
      end
      row :mission_vacancy_point
      row :mission_startup do |student|
        link_to "Mission Startup", student.mission_startup, target: "_blank"
      end
      row :mission_startup do |student|
        link_to "Mission Startup Generator", student.mission_startup_generator, target: "_blank"
      end
      row :mission_startup_point
    end
  end
end
