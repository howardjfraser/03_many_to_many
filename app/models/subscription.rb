class Subscription < ApplicationRecord
  belongs_to :person
  belongs_to :mailing_list

  # TODO: why is no scope required?
  validates :person, :mailing_list, presence: true, uniqueness: true
end
