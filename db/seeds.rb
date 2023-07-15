if Rails.env.development?
  AdminUser.create!(email: 'admin@developerevolution.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')
  user = User.create!(email: 'marcodotcastro@gmail.com', password: 'abc12345abc', password_confirmation: 'abc12345abc')

  student = Student.new
  student.user = user
  student.name = "Alyson Jhones"
  student.class_name = "13"
  student.enrollment_date = "16/01/2023".to_date
  student.type_career = "not_technology"
  student.description_career = "Engenheiro"
  student.salary = 0

  student.knowledge = "m0"
  student.profile_hotmart = "https://desenvolvendome-spd.club.hotmart.com/admin/beta/users/detail/PeAyaZA3eW"
  student.profile_discord = "https://discord.com/channels/998951206242234421/1007249425200058468/1067486414587052093"
  student.level_number = 1
  student.level_potential = "high"
  student.level_testimony = "good"
  student.class_progress = 37

  # Meeting
  student.meeting_situation = "bought"
  student.meeting_last = "17/Feb/2023".to_date
  student.meeting_number = 0
  student.meeting_link = "https://drive.google.com/drive/u/0/folders/1zUxuThPc1ldKC4QB_HyqLGA-Teh2pkmb"

  # Evaluation Social
  student.github_link = "https://github.com/jhonesaly"
  student.github_commit = 10
  student.github_intensity = "very_strong"
  student.wakatime_link = "https://wakatime.com/@98661d52-a1fd-4e23-a39b-ba76d31fdfdd"
  student.wakatime_time = 78
  student.wakatime_intensity = "strong"
  student.linkedin_link = "https://www.linkedin.com/in/alyson-jhones-539767121/"
  student.linkedin_followers = 527
  student.linkedin_post_last_month = 4
  student.linkedin_intensity = "very_strong"

  # Evaluation Method
  student.challenge = "one"
  student.mission_future = "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_"
  student.mission_future_generator = "https://docs.google.com/spreadsheets/d/1t-fcIABx8lXscjDQ8_teewif0L6o0KBz3emixeiR2sI"
  student.mission_future_point = 1
  student.mission_base = "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_"
  student.mission_base_generator = "https://docs.google.com/spreadsheets/d/1ybgxOF1gIbQ2Guw7xmABuOUeBkeb1yvc/edit#gid=1601534537"
  student.mission_base_point = 2
  student.mission_vacancy = "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_"
  student.mission_vacancy_generator = "https://docs.google.com/spreadsheets/d/1hs4llX2_xT8fat4DN80NmR5wqQCNaot3/edit#gid=825676826"
  student.mission_vacancy_point = 5
  student.mission_startup = "https://drive.google.com/drive/u/0/folders/1-Yr4qbL4ypisQ3mJwqCNAJzShq0hisy_"
  student.mission_startup_generator = "https://docs.google.com/spreadsheets/d/1Jb9bo3OVBY22W9EmGuHcNBNCo4h3BHKw/edit#gid=825676826"
  student.mission_startup_point = 10

  student.save!

  # Job position Generator
  Preparation.create(name: "Editora de Livro",
                     project: "https://github.com/user/repo",
                     readme: "https://github.com/user/repo/readme",
                     link: "https://github.com/user/repo/milestones/1",
                     release: 3,
                     release_type: "Milestone Release",
                     student: student)
  Preparation.create(name: "Banco Imobiliário",
                     project: "https://github.com/user/repo",
                     readme: "https://github.com/user/repo/readme",
                     link: "https://github.com/user/repo/issues/5",
                     release: 5,
                     release_type: "Issues 1",
                     student: student)
end