class Bird
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  field :name, type: String
  field :family, type: String
  field :added, type: String
  field :visible, type: Mongoid::Boolean

  embeds_many :continents
  accepts_nested_attributes_for :continents

  validate :validate_continents_count

  def as_json(*args)
    res = super
    res["id"] = res.delete("_id").to_s
    res
  end

  def validate_continents_count
    if self.continents.size < 1
      errors.add(:continents, "Need 1 or more items")
    end
  end

end
