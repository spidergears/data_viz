class Statistic
  include Mongoid::Document
  include Mongoid::Timestamps

  field :year, type: Integer
  field :value, type: Float, default: 0.0
  field :country

  belongs_to :wdi_data, class_name: 'WdiData'
  belongs_to :indicator
end
