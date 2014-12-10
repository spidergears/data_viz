class Api::V1::SearchController < ApplicationController
  def search
    countries = []
    indicators = []
    years = []
    params["search_term"].split(" ").each do |term|
      countries << is_country?(term) if is_country?(term)
      indicators << is_indicator?(term) if is_indicator?(term)
      years << is_year?(term) if is_year?(term)
    end
    countries = countries.flatten.uniq
    countries = ["World"] if countries.empty?
    indicators =  indicators.flatten.uniq 
    years = years.flatten.uniq
    plotdata = []
    
    indicators.each_with_index do |indicator, indicator_index|
      countries.each_with_index do |country, country_index|
        values = []
        labels = []
        data = WdiData.where(CountryName: country, IndicatorName: indicator).first
        if data
          model = data.to_model
          model.attribute_names.grep(/20*/).each_with_index do |attr, index|
            values << model[attr]
            labels << attr
          end
        end
        plotdata << ["#{indicator}", labels, values]
      end
    end
    render :json => plotdata
  end

  private
  
  def is_country?(txtstring)
    return Mongoid::Sessions.default.command(:text => "countries", :search => txtstring).first.last.collect { |record| record["obj"]["CountryName"] } if Mongoid::Sessions.default.command(:text => "countries", :search => txtstring).first.last.present?
    return false
  end

  def is_indicator?(txtstring)
    return Mongoid::Sessions.default.command(:text => "indicators", :search => txtstring).first.last.collect { |record| record["obj"]["IndicatorName"]} if Mongoid::Sessions.default.command(:text => "indicators", :search => txtstring).first.last.present?
    return false
  end

  def is_year?(txtstring)
    return txtstring.to_i if txtstring.to_i.between?(2000, 2014)
    return false
  end
end
