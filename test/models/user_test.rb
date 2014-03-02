require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile_name" do
  	user = User.new

    user.profile_name = users(:craig).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user can not have spaces in profile name" do
    user = User.new(first_name: 'craig', last_name: 'xoyles', email: 'bob@gmail.com')
    user.password = user.password_confirmation = 'asdqweasd'
    user.profile_name = 'xman 231'
    assert user.valid?
  end

  test "a user can have a correcly formatted name" do
    user = User.new(first_name: 'craig', last_name: 'xoyles', email: 'bob@gmail.com')
    user.password = user.password_confirmation = 'asdqweasd'
    user.profile_name = 'xman231'
    assert user.valid?
  end
end
