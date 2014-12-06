class Indicator
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code
  field :name
  field :description
  field :detail_description

  has_many :statistics
end
