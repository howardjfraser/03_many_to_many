require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  def setup
    @person = people(:david)
  end

  test 'get index' do
    get people_path
    assert_response :success
    assert_select 'h1', 'People'
    assert_select 'nav', 'Derailed 03'
  end

  test 'get show' do
    get person_path @person
    assert_response :success
    assert_select 'h1', @person.name
    assert_select 'nav', 'Derailed 03 / People'
  end

  test 'get new' do
    get new_person_path
    assert_response :success
    assert_select 'h1', 'New'
    assert_select 'nav', 'Derailed 03 / People'
  end

  test 'valid create' do
    assert_difference 'Person.count', 1 do
      post people_path, params: { person: { name: sample_string, job_title: sample_string, bio: sample_string } }
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', Person.last.name
    assert_select '.flash', "#{Person.last.name} has been created"
  end

  test 'invalid create' do
    assert_no_difference 'Person.count' do
      post people_path, params: { person: { name: '' } }
    end
    assert_response :success
    assert_select 'h1', 'New'
  end

  test 'get edit' do
    get edit_person_path @person
    assert_response :success
    assert_select 'h1', 'Edit'
    assert_select 'nav', 'Derailed 03 / People'
  end

  test 'valid update' do
    patch person_path @person, params: { person: { name: sample_string } }
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', @person.reload.name
    assert_select '.flash', "#{@person.name} has been updated"
  end

  test 'invalid update' do
    patch person_path @person, params: { person: { name: '' } }
    assert_response :success
    assert_select 'h1', 'Edit'
  end

  test 'destroy' do
    assert_difference 'Person.count', -1 do
      delete person_path @person
    end
    assert_response :redirect
    follow_redirect!
    assert_select 'h1', 'People'
    assert_select '.flash', "#{@person.name} has been deleted"
  end
end
