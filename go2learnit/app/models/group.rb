class Group < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description
  validates_length_of :title, minimum: 1, maximum: 80
  validates_length_of :description, minimum: 1
  validates_length_of :custon_address, allow_blank: true, minimum: 1, maximum: 80

end
