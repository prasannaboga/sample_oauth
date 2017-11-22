namespace :profile do
  desc 'generate profile data using faker gem'
  task generate: :environment do
    10.times do |x|
      User.create!(email: Faker::Internet.email, password: Faker::Internet.password(6, 8))
    end
  end
end
