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
  # Job Position Generator

  # Create interviews with student relation
  video_urls = %w[https://vimeo.com/190479606 https://vimeo.com/76979871 https://vimeo.com/195085022]


  interview = Interview.create(interview_type: "Vida", student: student)
  interview.interview_videos.create(video_link: "https://vimeo.com/123456")

  # Exemplo de criação de outro vídeo associado à mesma entrevista
  interview.interview_videos.create(video_link: "https://vimeo.com/789012")

  # Create Scripts
  script = Script.create(category: "Empresa", student: student)
  script.script_questions.create(category: "Quem estava no momento?", description: "Eu e o Tech Lead")

  script2 = Script.create(category: "Superação", student: student)
  script2.script_questions.create(category: "O que aconteceu?", description: "Com melhora na  comunicação foi possivel entregar as demandas solicitadas.")

  # Create Technical Test
  test = Test.create(
    repository_link: 'https://github.com/user/repo1',
    project_link: 'https://github.com/user/repo1/projects/1',
    readme_link: 'https://github.com/user/repo1/blob/main/README.md',
    student: student
  )
  tests_battle = test.tests_battles.create(
    battle: 1,
    milestone_release_link: 'https://github.com/user/repo1/milestones/123',
    pull_request_release_link: 'https://github.com/user/repo1/pull/123'
  )
  tests_battle.tests_issues.create(
    issue_link: 'https://github.com/user/repo1/issues/12',
    pull_request_link: "https://github.com/user/repo1/tree/branch_12"
  )
  tests_battle.tests_issues.create(
    issue_link: 'https://github.com/user/repo1/issues/13',
    pull_request_link: "https://github.com/user/repo1/tree/branch_13"
  )

  tests_battle2 = test.tests_battles.create(
    battle: 3,
    milestone_release_link: 'https://github.com/user/repo1/milestones/456',
    pull_request_release_link: 'https://github.com/user/repo1/pull/456'
  )
  tests_battle2.tests_issues.create!(
    issue_link: 'https://github.com/user/repo1/issues/45',
    pull_request_link: "https://github.com/user/repo1/tree/branch_45"
  )
  tests_battle2.tests_issues.create!(
    issue_link: 'https://github.com/user/repo1/issues/14',
    pull_request_link: "https://github.com/user/repo1/tree/branch_14"
  )
end