class MailingList < ApplicationRecord
  has_many :subscriptions
  has_many :people, through: :subscriptions

  validates :name, :email, presence: true, length: { maximum: 48 }
  scope :sorted, -> { order('lower(name)') }
end
