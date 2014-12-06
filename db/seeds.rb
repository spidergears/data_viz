require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

#file = CSV.open("#{Rails.root}/db/Health.csv", 'r')
#columns = file.readline

#while(row = file.readline) do 
#  Indicator.create!(code: row[0], name: row[1], description: row[3], detail_description: row[5])
#end

table = CSV.table("#{Rails.root}/db/dummy.csv")
header = table.headers

file = CSV.open("#{Rails.root}/db/dummy.csv", 'r', headers: true)

while(row = file.readline) do 
  p row[3]
  indicator = Indicator.where(code: row[3]).first
  p indicator

  data = WdiData.create!(country: row[0], country_code: row[1], indicator: indicator)

  header[4..-1].each do |year|
    Statistic.create!(indicator: indicator, wdi_data: data, value: row[year.to_s], country: row[0])
  end
end
