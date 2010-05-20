require File.dirname(__FILE__) + '/../test_helper'

class PageTest < Test::Unit::TestCase
  fixtures :pages

  def test_invalid_if_any_field_empty
    page = Page.new
    assert !page.valid?
    assert page.errors.invalid?(:title)
    assert page.errors.invalid?(:body)    
  end
  
  def test_valid_fields
    page = pages(:valid_page)
    assert page.valid?
  end
end
