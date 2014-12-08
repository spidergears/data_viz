require 'csv'
require 'pry'
def export(infile, outfile)
  csvin =  CSV.read(infile, headers: true)
  CSV.open(outfile, "wb") do |csvout|
    country_data = [ csvin["CountryCode"].uniq, csvin["CountryName"].uniq ].transpose
    country_data.each do |country|
      csvout << country
    end
  end
  csvin.close
end

export("WDI_Data.csv", "countries.csv")

#on Console
#data = CSV.open("mod.csv", headers: true)
#while (!data.eof?) do
#  WdiData.create!(data.readline().to_hash)
#end
