require 'test_helper'

class MailingListIntegrationTest < ActionDispatch::IntegrationTest
  test 'add mailing list' do
    new_name = sample_string
    new_email = sample_string

    visit '/mailing_lists'
    click_on 'Add New'
    fill_in 'Name', with: new_name
    fill_in 'Email', with: new_email
    click_on 'Save'
    assert page.has_content? new_name
    assert page.has_content? new_email
    assert page.has_content? "#{new_name} mailing list has been created"
    click_on 'Mailing Lists'
    assert page.has_content? new_name
  end

  test 'edit mailing list' do
    new_name = sample_string

    visit '/mailing_lists'
    first('li a').click
    click_on 'Edit'
    fill_in('Name', with: new_name)

    click_on 'Save'
    assert page.has_content? new_name
    assert page.has_content? "#{new_name} mailing list has been updated"
  end
end
