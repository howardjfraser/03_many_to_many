require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @person = people(:david)
    @mailing_list = mailing_lists(:support)
  end

  test 'person has many subscriptions and mailing_lists' do
    assert @person.subscriptions.count == 2
    assert @person.mailing_lists.count == 2
    assert @person.mailing_lists.first.name == 'Support'
  end

  test 'mailing list has many subscriptions and people' do
    assert @mailing_list.subscriptions.count == 1
    assert @mailing_list.people.count == 1
    assert @mailing_list.people.first.name == 'David Jones'
  end
end
