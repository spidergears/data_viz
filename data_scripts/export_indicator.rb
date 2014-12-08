require 'csv'

def export(infile, outfile)
  csvin =  CSV.open(infile, "rb", headers: true, encoding: "ISO8859-1")
  CSV.open(outfile, "wb", encoding: "ISO8859-1") do |csvout|
    while(row = csvin.readline()) do
      csvout << [ row["SeriesCode"], row["Topic"], row["Dataset"], row["IndicatorName"], row["ShortDefinition"], row["LongDefinition"], row["Unit_Measure"] ]
    end
  end

  csvin.close
end

export("WDI_Series.csv", "indicators.csv")

#on Console
#data = CSV.open("mod.csv", headers: true)
#while (!data.eof?) do
#  WdiData.create!(data.readline().to_hash)
#end
