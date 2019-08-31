require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup' do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'invalid',
                                         password: '',
                                         password_confirmation: '' } }
    end
    assert_template 'users/new'
  end

  test 'valid signup' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'John Doe',
                                         email: 'john@exmaple.com',
                                         password: 'secret',
                                         password_confirmation: 'secret' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert_select 'div.container>.alert-success'
  end
end
