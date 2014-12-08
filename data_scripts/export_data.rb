require 'csv'

def export(infile, outfile)
  csvin =  CSV.open(infile, "rb", headers: true)
  CSV.open(outfile, "wb") do |csvout|
    while(row = csvin.readline()) do
      csvout << [ row["CountryName"], row["CountryCode"], row["IndicatorName"], row["IndicatorCode"], row["2000"], row["2001"], row["2002"], row["2003"], row["2004"], row["2005"], row["2006"], row["2007"], row["2008"], row["2009"], row["2010"], row["2011"], row["2012"], row["2013"], row["2014"] ]
    end
  end

  csvin.close
end

export("WDI_Data.csv", "mod.csv")

#on Console
#data = CSV.open("mod.csv", headers: true)
#while (!data.eof?) do
#  WdiData.create!(data.readline().to_hash)
#end
