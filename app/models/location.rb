class Location < ApplicationRecord
    belongs_to :user
    
    validates :timezone, presence: true
    validates :location_type, presence: true
    validates :location_name, presence: true
    validates :country_code, presence: true
end
