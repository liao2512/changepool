json.array!(@donors) do |donor|
  json.extract! donor, :id, :name, :email, :password_digest, :remember_digest, :birthday, :country, :bio, :isMonthlyUniversalFundMember, :isAnnualUniversalFundMember, :isAnonymous
  json.url donor_url(donor, format: :json)
end
