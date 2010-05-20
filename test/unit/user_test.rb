require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users

  def test_create_valid_user
    user = User.new(:username => 'John Johnson', :email => 'john@johnson.com', 
        :password => 'john', :password_confirmation => 'john', 
        :profile => 'Postman')
    assert user.save
  end

  def test_invalid_duplicate_username
    user = User.new(:username => 'Gjergj Arbeni', :email => 'gjergjarbeni@hotmail.com', 
        :password => 'gjergj', :password_confirmation => 'gjergj', 
        :profile => 'Postgraduate Student')
    assert !user.save
  end

end