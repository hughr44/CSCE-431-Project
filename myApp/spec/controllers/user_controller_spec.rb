require 'rails_helper'

require_relative '../../app/models/user'
require_relative '../../app/controllers/user_controller'


RSpec.describe UserController, type: :controller do
    
    describe 'createUser' do
        
        before do
            @adminUser1 = User.create!(:email=>'admin1@email.com', :permissionLevel=>'admin', :linkedInUrl=>'linkedin.com')
            @adminUser2 = User.create!(:email=>'admin2@email.com', :permissionLevel=>'admin', :linkedInUrl=>'linkedin.com')
            @memberUser1 = User.create!(:email=>'member1@email.com', :permissionLevel=>'member', :linkedInUrl=>'linkedin.com')
            @memberUser2 = User.create!(:email=>'member2@email.com', :permissionLevel=>'member', :linkedInUrl=>'linkedin.com')
        end
        
        describe 'Admin Create Member' do
            it 'admin creating member should be successful' do
                expect(@adminUser1.createUser(@adminUser1, @memberUser1)).to be_success
            end
        end
        
        describe 'Admin Create Admin' do
            it 'admin creating admin should be successful' do
                expect(createUser(@adminUser1, @adminUser2)).to be_success
            end
        end
        
        describe 'Member Create Member' do
            it 'member creating member should not be successful' do
                expect(createUser(@memberUser1, @memberUser2)).not_to be_success
            end
        end
        
        describe 'Member Create Admin' do
            it 'member creating admin should not be successful' do
                expect(createUser(@memberUser1, @adminUser2)).not_to be_success
            end
        end   
        
    end

end
