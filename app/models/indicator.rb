class Indicator
  include Mongoid::Document
  include Mongoid::Timestamps

  field :SeriesCode, type: String
  field :Topic, type: String
  field :Dataset, type: String
  field :IndicatorName, type: String
  field :ShortDefinition, type: String
  field :LongDefinition, type: String
  field :Unit_Measure, type: String
end
