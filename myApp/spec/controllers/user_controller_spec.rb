require 'rails_helper'

require_relative '../../app/models/user'
require_relative '../../app/controllers/user_controller'


RSpec.describe UserController, type: :controller do
    
    describe 'Testing UserController' do
        
        describe 'new' do
            it 'calling new from UserController should be successful' do
                UserController.new
                expect(response).to have_http_status(:success)
            end
        end
        
        describe 'getUser' do
            it 'getUser on valid email should return cooresponding user' do
                @testUser = User.create(email: 'nandan@tamu.edu', permissionLevel: 'member', linkedInUrl: '')
                expect(UserController.new.getUser('nandan@tamu.edu')).to eq(@testUser)
            end
        end
        
        describe 'getUser' do
            it 'getUser on invalid email should return nil' do
                expect(UserController.new.getUser('doesntexist@tamu.edu')).to eq(nil)
            end
        end
        
        describe 'userExists' do
            it 'userExists on existing user should be true' do
                User.create(email: 'nandan@tamu.edu', permissionLevel: 'member', linkedInUrl: '')
                expect(UserController.new.userExists('nandan@tamu.edu')).to be_truthy
            end
        end
        
        describe 'userExists' do
            it 'userExists on non-existing user should be false' do
                User.create(email: 'nandan1@tamu.edu', permissionLevel: 'member', linkedInUrl: '')
                expect(UserController.new.userExists('nandan@tamu.edu')).to be_falsy
            end
        end
        
        describe 'destroy' do
            before do
                @testUser1 = User.create(email: 'nandan@tamu.edu', permissionLevel: 'officer', linkedInUrl: '')
                params = {getUser: @testUser1}
                session = {userinfo: {"info" => {"email" => 'nandan@tamu.edu'}}}
                post :destroy, params: params, session: session
            end
            
            it 'creating then destroying user then calling userExists on specified email shoud be false' do
                UserController.new.destroy
                expect(UserController.new.userExists('nandan@tamu.edu')).to be_falsy
            end
        end
        
    end

end
