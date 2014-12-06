class WdiData
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :region
  field :country
  field :country_code

  has_many :statistics
  belongs_to :indicator
end
