# == Schema Information
#
# Table name: objectives
#
#  id               :bigint           not null, primary key
#  achieved         :text
#  expected_results :text
#  max_deadline     :date
#  metrics          :text
#  min_deadline     :date
#  people_involved  :text
#  reason           :text
#  resources        :text
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_id       :bigint           not null
#
# Indexes
#
#  index_objectives_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
FactoryBot.define do
  factory :objective do
    title { "Conseguir um salário como programador de R$ 5000,00" }
    reason { "Isso seria a consolidação da minha carreira como programador. Não mais eu estaria dependente financeiramente dos meus pais e eu estaria consolidando minha profissão." }
    people_involved { "Eu mesmo Gabriel." }
    resources { "Tempo e disciplina" }
    expected_results { "Conseguir a primeira vaga de programação. A partir daí participar de pelo menos uma entrevista emprego por mês até conseguir o salário de 5000,00" }
    achieved { "Ao ser contratado com o salário de R$ 5000,00." }
    metrics { "Numero e entrevistas de emprego feitas. Acompanhamento e cumprimento das tarefas do lastro." }
    max_deadline { "2024-07-31" }
    min_deadline { "2023-12-31" }
    student { association(:student) }
  end
end
