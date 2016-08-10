class MailingList < ApplicationRecord
  validates :name, :email, presence: true, length: { maximum: 48 }
  scope :sorted, -> { order('lower(name)') }
end
