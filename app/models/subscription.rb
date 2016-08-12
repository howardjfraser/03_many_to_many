class Subscription < ApplicationRecord
  belongs_to :person
  belongs_to :mailing_list
end
