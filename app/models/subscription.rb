class Subscription < ApplicationRecord
  belongs_to :person
  belongs_to :mailing_list

  validates :person, presence: true, uniqueness: { scope: :mailing_list }
  validates :mailing_list, presence: true, uniqueness: { scope: :person }
end
