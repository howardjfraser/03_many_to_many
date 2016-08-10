require 'test_helper'

class MailingListTest < ActiveSupport::TestCase
  def setup
    @mailing_list = mailing_lists(:support)
  end

  test 'valid' do
    assert @mailing_list.valid?
  end

  test 'name is required' do
    @mailing_list.name = nil
    refute @mailing_list.valid?
  end

  test 'email is required' do
    @mailing_list.email = nil
    refute @mailing_list.valid?
  end

  test 'name max length' do
    @mailing_list.name = 'a' * 48
    assert @mailing_list.valid?
    @mailing_list.name = 'a' * 49
    refute @mailing_list.valid?
  end

  test 'email max length' do
    @mailing_list.email = 'a' * 48
    assert @mailing_list.valid?
    @mailing_list.email = 'a' * 49
    refute @mailing_list.valid?
  end

  test 'sort order' do
    @mailing_lists = MailingList.all.sorted
    assert @mailing_lists.last == @mailing_list
  end
end
