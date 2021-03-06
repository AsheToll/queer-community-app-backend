class Event < ApplicationRecord
    belongs_to :location
    has_many :event_creators
    has_many :creators, through: :event_creators, class_name: 'User'
    has_many :event_attendees
    has_many :attendees, through: :event_attendees, class_name: 'User'
    has_many :category_events
    has_many :categories, through: :category_events
    has_many :event_addresses
    has_many :addresses, through: :event_addresses
end
