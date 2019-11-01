require 'rails_helper'

require_relative '../../app/models/user'
require_relative '../../app/controllers/user_controller'

RSpec.describe UserController, type: :controller do
    
    describe 'Testing UserController' do
        
        describe 'userExists' do
            it 'checks if user already exists' do
                User.create(email: 'nandan@tamu.edu', permissionLevel: 'member', linkedInUrl: '')
                expect(UserController.new.userExists('nandan@tamu.edu')).to be_truthy
            end
            
        end
        
        describe 'getUser' do 
            it 'checks if the user has the email required' do
                User.create(email: 'nandan@tamu.edu', permissionLevel: 'member', linkedInUrl: '')
                expect(UserController.new.getUser('nandan@tamu.edu')).to be_truthy
            end
        end
        
    end

end
