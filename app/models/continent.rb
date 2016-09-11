class Continent
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  field :name, type: String
  embedded_in :bird
end
