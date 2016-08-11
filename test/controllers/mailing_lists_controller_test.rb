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
    assert_select '.btn', 'Add New'
  end

  test 'show' do
    get mailing_list_path @mailing_list
    assert_response :success
    assert_select 'h1', @mailing_list.name
  end

  test 'new' do
    get new_mailing_list_path
    assert_response :success
    assert_select 'h1', 'New'
  end

  test 'valid create' do
    name = sample_string
    assert_difference 'MailingList.count', 1 do
      post mailing_lists_path, params: { mailing_list: {name: name, email: sample_string}}
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', name
    assert_select '.flash', "#{name} mailing list has been created"
  end

  test 'invalid create' do
    assert_no_difference 'MailingList.count' do
      post mailing_lists_path, params: {mailing_list: { name: '', email: ''}}
    end
    assert_response :success
    assert_select 'h1', 'New'
    assert_select '.field_with_errors label', 'Name can’t be blank'
  end

  test 'edit' do
    get edit_mailing_list_path @mailing_list
    assert_response :success
    assert_select 'h1', 'Edit'
  end

  test 'valid update' do
    new_name = sample_string
    patch mailing_list_path @mailing_list, params: {mailing_list: {name: new_name}}
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', new_name
    assert_select '.flash', "#{new_name} mailing list has been updated"
  end

  test 'invalid update' do
    patch mailing_list_path @mailing_list, params: {mailing_list: {name: ''}}
    assert_response :success
    assert_select 'h1', 'Edit'
    assert_select '.field_with_errors label', 'Name can’t be blank'
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
