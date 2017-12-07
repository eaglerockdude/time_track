require 'rails_helper'

RSpec.describe User, type: :model do
#  describe User do     (this  syntax works also)

  before do
    @user = User.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
  end

  describe 'CREATE a user ' do
    it 'can be created' do
      expect(@user).to be_valid
    end
    it "validates name - first_name and last_name cannot be blank"  do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    
  end
  describe 'custom full name method' do
    it 'formats first and last name into one for display using a helper method' do
      expect(@user.full_name).to eq('Lastname, Firstname')
      byebug
    end
  end

end
