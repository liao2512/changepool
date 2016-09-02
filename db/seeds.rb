99.times do |n|
  name  = Faker::Company.name
  username = "partner#{n+1}"
  email = "p#{n+1}@mail.com"
  password = "lalalala"
  Partner.create!( name:  name,
                  username:  username,
                  email: email,
                  password:              password,
                  password_confirmation: password)
end