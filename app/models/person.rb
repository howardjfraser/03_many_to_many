class Person < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :mailing_lists, through: :subscriptions

  validates :name, :job_title, presence: true, length: { maximum: 48 }
  validates :bio, presence: true, length: { maximum: 512 }

  scope :sorted, -> { order('lower(name)') }

  def first_name
    name.split(' ')[0]
  end
end
