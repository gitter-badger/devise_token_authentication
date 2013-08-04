require 'test_helper'

class UserTest < ActiveSupport::TestCase
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

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:jason).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	# puts user.errors.inspect
  	
  end

  test "a user should have a profile name without space" do
  	user = User.new
  	user.profile_name = "My Profile With Space"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name"  do
    user = User.new(:first_name => 'Jason', :last_name => 'Seifer', :email => "abc@abc.com")
    # user = User.new
    user.password = user.password_confirmation =  'abckdjehe'

    
    user.profile_name = "jasonstaham"

    assert user.valid?
    puts user.errors.inspect
  end

end
