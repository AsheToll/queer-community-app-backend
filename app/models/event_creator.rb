class EventCreator < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    belongs_to :event
end
