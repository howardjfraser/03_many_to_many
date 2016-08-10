require 'test_helper'

class MailingListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @mailing_list = MailingList.all.first
  end
  test 'index' do
    get mailing_lists_path
    assert_response :success
    assert_select 'h1', 'Mailing lists'
    assert_select '#mailing_lists', /Development.*Marketing.*Support/m

    # TODO: check new link
  end

  test 'show' do
    get mailing_list_path @mailing_list
    assert_response :success
    assert_select 'h1', @mailing_list.name
  end
end
