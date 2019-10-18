class UserController < ApplicationController
    # caller is an email address, so make sure you get user object associated with that email
    # so that you can check that they are admin.
    # user is a user object that has an email and permission level
    def userParams
        params.require(:user).permit(:email, :permissionLevel, :linkedInUrl)
    end

    def create
        @user = User.create!()
        @user.save
    end

    def createUser(requester, user)
        if((user.permissionLevel=='admin' && requester.permissionLevel=='admin') || user.permissionLevel=='member') 
            @user = User.create!(userParams)
            #redirect_to login
        end
    end
    
    def updateUser(requester, user)
        if (user.permissionLevel=='admin' && requester.permissionLevel=='admin')
            @user = User.find(user)
            @user.update_attributes!(user_params)
        end
            
    end
    
    def getUser(email)
        @user = User.find(email)
    end
    
    def getOfficers
        @user = User.where('permissionLevel' => 'admin')
    end
    
    def getUsers
        @user = User.all
    end
    
    def deleteUser(requester, user)
        if(requester==user || requester.permissionLevel=='admin') 
            @user.destory
        end
    end
    
    def login
        @user = User.all
    end
end
