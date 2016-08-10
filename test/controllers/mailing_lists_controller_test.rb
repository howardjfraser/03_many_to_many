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

  test 'delete' do
    assert_difference 'MailingList.count', -1 do
      delete mailing_list_path @mailing_list
      follow_redirect!
      assert_select 'h1', 'Mailing lists'
      assert_select '.flash', "#{@mailing_list.name} mailing list has been deleted"
    end
  end
end
