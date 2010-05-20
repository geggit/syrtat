require File.dirname(__FILE__) + '/../test_helper'
require 'users_controller'

# Re-raise errors caught by the controller.
class UsersController; def rescue_action(e) raise e end; end

class UsersControllerTest < Test::Unit::TestCase
  def setup
    @controller = UsersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_signup_page
    get :new
    assert_response :success
  end
  
  def test_valid_signup_and_redirect
    post :create, :user => {:username => 'Gjergj Arbeni', 
                            :email => 'gjergjarbeni@hotmail.com', 
                            :password => 'gjergj', 
                            :password_confirmation => 'gjergj', 
                            :profile => 'Me'}
    assert_response :redirect
  end
  
  def test_invalid_signup_dupe_username
    post :create, :user => {:username => 'stephen',
                            :email => 'gjergjarbeni@hotmail.com', 
                            :password => 'gjergj', 
                            :password_confirmation => 'gjergj', 
                            :profile => 'Me'}
    assert assigns(:user).errors.on(:username)
    assert_response :success
    assert_template 'users/new'
  end

end
