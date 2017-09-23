# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'correo3@correo.com', password: 123456)

9.times do |i|
  ele = Tarea.new(
                  nombre: Faker::Food.dish,
                  descripcion: Faker::Overwatch.quote,
                  photo: "http://lorempixel.com/250/250/city/#{i + 1}/"
                  )
  ele.users << user
  ele.save
end
