99.times do |n|
  name  = Faker::Company.name
  username = "partner#{n+1}"
  email = "p#{n+1}@mail.com"
  password = "lalalala"
  Partner.create!( name:  name,
                  username:  username,
                  email: email,
                  password:              password,
                  password_confirmation: password,
                  activated: true,
                  activated_at: Time.zone.now)
end

partners = Partner.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.word
  partners.each { |partner| partner.campaigns.create!(name: name) }
end