require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  before do
    @adminuser = AdminUser.create(email: 'test@gmail.com', first_name:'firstname', last_name:'lastname',password:'password', password_confirmation:'password')
  end
 describe 'CREATE an admin user ' do
   it 'can be created' do
     expect(@adminuser).to be_valid
   end
   it "first_name and last_name cannot be blank"  do
     @adminuser.first_name = nil
     @adminuser.last_name = nil
     expect(@adminuser).to_not be_valid
     end
   it "type should be admin"  do

     expect(@adminuser.type).to eq('AdminUser')
   end
 end
end
