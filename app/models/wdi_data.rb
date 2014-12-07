class WdiData
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :CountryName, type: String
  field :CountryCode, type: String
  field :IndicatorName, type: String
  field :IndicatorCode, type: String
  field "2000", type: Float
  field "2001", type: Float
  field "2002", type: Float
  field "2003", type: Float
  field "2004", type: Float
  field "2005", type: Float
  field "2006", type: Float
  field "2007", type: Float
  field "2008", type: Float
  field "2009", type: Float
  field "2010", type: Float
  field "2011", type: Float
  field "2012", type: Float
  field "2013", type: Float
  field "2014", type: Float
end
