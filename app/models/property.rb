class Property < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :rent
    validates :address
    validates :age
    validates :remarks
  end
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, 
                                 allow_destroy: true,
                                 reject_if: :all_blank
end
