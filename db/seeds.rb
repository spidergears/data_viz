require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

file = CSV.open("#{Rails.root}/db/Health.csv", 'r')
columns = file.readline

while(row = file.readline) do 
  p row
  Indicator.create!(code: row[0], name: row[1], description: row[3], detail_description: row[5])
end
