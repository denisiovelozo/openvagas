# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'user@outlook.com', password: '786125', password_confirmation: '786125')

company = Company.new(name: 'Company Tech', url: 'https://google.com', user_id: user.id)
company.logo.attach(io: File.open("#{Rails.root}/spec/fixtures/images/logotipo-empresa.jpg"), filename: 'logotipo-empresa.jpg')
company.save!

cities_and_states = [['CE', 'Fortaleza'], ['SP', 'Sao Paulo'], ['RJ', 'Rio de Janeiro']]
5.times do |t|
  city_and_state = cities_and_states.sample
  Position.create!(
    name: "Vaga #{t + 1}", career: (0..6).to_a.sample, contract: (0..2).to_a.sample, remote: true, publish: true,
    state: city_and_state.first, city: city_and_state.last, company_id: Company.last.id,
    description: 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vitae fuga, nobis culpa quidem ipsum, quod exercitationem similique aliquam dolorem veniam praesentium! Adipisci ad deserunt illo, ab omnis distinctio quae at.',
    summary: 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vitae fuga, nobis culpa quidem ipsum, quod exercitationem similique aliquam dolorem veniam praesentium! Adipisci ad deserunt illo, ab omnis distinctio quae at.'
  )
end