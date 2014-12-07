class Country
  include Mongoid::Document
  include Mongoid::Timestamps

  field :CountryCode, type: String
  field :CountryName, type: String
  
end
