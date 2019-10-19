require 'rails_helper'

require_relative '../../app/models/user'
require_relative '../../app/controllers/user_controller'


RSpec.describe UserController, type: :controller do
    
    describe 'Testing UserController' do
        
        describe 'Member Destroy' do
            it 'destroy member should not be successful' do
                controller.params['email'] = 'nandan@tamu.edu'
                expect(UserController.new.destroy).to be_success
            end
        end   
        
        describe 'Member Create' do
            it 'creating member should be successful' do
                controller.params['email'] = 'nandan@tamu.edu'
                expect(UserController.new.create).to be_success
            end
        end   
        
        describe 'getUser1' do
            it 'getUser on valid email should be successful' do
                expect(UserController.new.getUser('nandan@tamu.edu')).to be_success
            end
        end
        
        describe 'getUser2' do
            it 'getUser on invalid email should not be successful' do
                expect(UserController.new.getUser('doesntexist@tamu.edu')).not_to be_success
            end
        end
        
        describe 'userExists1' do
            it 'userExists on existing user should be true' do
                expect(UserController.new.userExists('nandan@tamu.edu')).to be_truthy
            end
        end
        
        describe 'userExists2' do
            it 'userExists on non existing user should be false' do
                expect(UserController.new.userExists('doesntexist@tamu.edu')).to be_falsy
            end
        end
        
        describe 'index' do
            it 'index should be success' do
                expect(UserController.new.index).to be_success
            end
        end
        
        describe 'new' do
            it 'new should be success' do
                expect(UserController.new).to be_success
            end
        end
        
        describe 'user_params' do
            it 'user_params should be success' do
                expect(UserController.new.user_params).to be_success
            end
        end
        
    end

end
