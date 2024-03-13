# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'httparty'
require 'csv'

response = HTTParty.get('https://api.thedogapi.com/v1/breeds')
if response.success?
  breeds = JSON.parse(response.body)
  breeds.each do |breed|
    Breed.find_or_create_by(name: breed['name'], temperament: breed['temperament'] || "Unknown")
  end
else
  puts "Failed to fetch breeds from The Dog API"
end


csv_text = File.read(Rails.root.join('db', 'owners.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  Owner.find_or_create_by(name: row['name'], email: row['email'], phone_number: row['phone_number'], address: row['address'])
end



# 100 Adoptions
100.times do
  Adoption.create!(
    breed_id: Breed.all.sample.id,
    owner_id: Owner.all.sample.id,
    adoption_date: Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
end

  
