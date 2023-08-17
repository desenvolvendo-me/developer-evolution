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

  # Future mission:
  goal_1 = Goal.create(description: "Git", student: student)
  goal_2 = Goal.create(description: "Ruby", student: student)

  GoalQuestion.create(type_question: "Detalhe", description: "O que eu desejo alcançar?", answer: "Concluir o curso de Git", goal: goal_1)
  GoalQuestion.create(type_question: "Tempo", description: "Qual é o prazo máximo para atingir?", answer: "uma semana", goal: goal_2)

  # Future Mission:
  micro_goal_1 = MicroGoal.create(micro_goal: "Estudar Git e Github", student: student )
  micro_goal_2 = MicroGoal.create(micro_goal: "Estudar Banco de dados", student: student )

  MicroGoalTask.create(task: "Git / Github", start_date: "2023-07-11", end_date: "2023-07-13", percentage: 20, micro_goal: micro_goal_1)
  MicroGoalTask.create(task: "postgres", start_date: "2023-07-11", end_date: "2023-07-13", percentage: 20, micro_goal: micro_goal_2)

  # Objective generator
  objetivo1 = Objective.create( title: 'OBJETIVO 1: Tornar-me um pogramador PHP/Laravel pleno', student: student)
  objetivo2 = Objective.create( title: 'OBJETIVO 2: Trabalhar como programador para uma empresa internacional', student: student)
  objetivo3 = Objective.create( title: 'OBJETIVO 3: Estudo', student: student)

  objetivo1.objective_questions.create(
    type_question: 'Detalhe',
    description: 'O que eu desejo alcançar?',
    answer: 'Ter domínio da stack e da parte negocial de um produto.'
  )
  objetivo1.objective_questions.create(
    type_question: 'Detalhe',
    description: 'Por que esse objetivo é importante?',
    answer: 'Quero entregar resultados para as empresas onde estiver. Quero saber conversar com os stakeholders e com a equipe de igual para igual, trazendo soluções para os problemas e saber negociar prazos e estimativas de entrega das soluções. Percebi que nesses pontos eu tenho muita dificuldade e por vezes, nas reuniões de time, entro mudo e saio calado, sem ter nenhuma idéia ou opinião sobre o que está sendo discutido.'
  )
  objetivo1.objective_questions.create(
    type_question: 'Detalhe',
    description: 'Quem são os envolvidos?',
    answer: 'William'
  )
  objetivo2.objective_questions.create(
    type_question: 'Métrica',
    description: 'Quais são os resultados esperados, em termos quantitativos?',
    answer: 'Construir 1 projeto com no ménimo 4 commits feitos por dia no GitHub onde eu tenha domínio do que o sistema resolve e o que cada linha de código faz.'
  )
  objetivo2.objective_questions.create(
    type_question: 'Métrica',
    description: 'Como vou saber se foi alcançado?',
    answer: 'Quando tiver este projeto criado eu saiba explicá-lo em uma entrevista'
  )
  objetivo3.objective_questions.create(
    type_question: 'Detalhe',
    description: 'O que eu desejo alcançar?',
    answer: 'Dominar linguagem ruby e rails'
  )
  objetivo3.objective_questions.create(
    type_question: 'Detalhe',
    description: 'Por que esse objetivo é importante?',
    answer: 'Porque estarei profissionalmente preparado nessa stack e pronto para virar a chave e começar a pensar em conhecimentos que vão além de código, como aperfeiçoar comunicação, gestão, preocupar com fazer entregas de qualidade e pensar mais em negócio.'
  )
  objetivo3.objective_questions.create(
    type_question: 'Detalhe',
    description: 'Quem são os envolvidos?',
    answer: 'Minha família, Eu, minha esposa Elizama e filha Karen.	'
  )
  objetivo3.objective_questions.create(
    type_question: 'Detalhe',
    description: 'Quais são os recursos necessários?',
    answer: 'Tempo, computador, auto gerenciamento, documentação de cada tecnologia e muita prática.'
  )
  objetivo3.objective_questions.create(
    type_question: 'Métrica',
    description: 'Quais são os resultados esperados, em termos quantitativos?',
    answer: 'Tendo domínio de pelo menos 70% dos métodos disponíveis da linguagem e 70% das funcionalidades do Rails.'
  )

  # Seed para Course
  course_1 = Course.create(type_course: "Git/GitHub", student: student)
  course_2 = Course.create(type_course: "Lógica de programação", student: student)
  # ... adicione mais cursos conforme necessário ...

  # Seed para CourseBasic
  CourseBasic.create(
    link_course: "https://www.youtube.com/watch?v=PTY6QgyxWkk&list",
    link_repository: "https://github.com/desenvolvendo-me/b/seeds.rb",
    link_certified: "https://replit.com",
    avaliation_course: "5",
    avaliation_apprenticeship: "4",
    number_of_course: "1",
    course: course_1
  )

  CourseBasic.create(
    link_course: "https://www.youtube.com/watch?v=abc123",
    link_repository: "https://github.com/desenvolvendo-me/c/seeds.rb",
    link_certified: "https://replit.com",
    avaliation_course: "4",
    avaliation_apprenticeship: "3",
    number_of_course: "2",
    course: course_2
  )
end