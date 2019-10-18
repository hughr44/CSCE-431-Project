class UserController < ApplicationController
<<<<<<< HEAD
    # caller is an email address, so make sure you get user object associated with that email
    # so that you can check that they are admin.
    # user is a user object that has an email and permission level
    def userParams
=======
    def user_params
>>>>>>> b8f4cf9fd85ffb33e478e88e03cef5aadd06b698
        params.require(:user).permit(:email, :permissionLevel, :linkedInUrl)
    end
    
    def new
        @user = User.new
    end

<<<<<<< HEAD
    def create
        @user = User.create!(userParams)
        @user.save
    end

    def createUser(requester, user)
        if((user.permissionLevel=='admin' && requester.permissionLevel=='admin') || user.permissionLevel=='member') 
            @user = User.create!(userParams)
            #redirect_to login
=======
    def index
        @users = User.all
    end

    def create
        if (userExists(params['email']))
            return
        end
        
        if (!params.has_key?('permissionLevel'))
            params['permissionLevel'] = 'member'
        end
        
        requester_email = getEmailFromToken(@token)
        requester = getUser(requester_email)
        
        if((params['permissionLevel']=='officer' && requester.permissionLevel=='officer') || params['permissionLevel']=='member') 
            # user = User.new
            # user.email = params['email']
            # user.permissionLevel = params['permissionLevel']
            # user.linkedInUrl = params['linkedInUrl']
            # user.save
            
            user = User.create(email: params['email'], permissionLevel: params['permissionLevel'], linkedInUrl: params['linkedInUrl'])
            puts user.email
>>>>>>> b8f4cf9fd85ffb33e478e88e03cef5aadd06b698
        end
    end
    
    def destroy
        requester_email = getEmailFromToken(@token)
        requester = getUser(requester_email)
        user = getUser(params['email'])
        
        if (requester.email == user.email || requester.permissionLevel=='officer') 
            user.destroy
        end
    end
    
    def setToken(token)
        # chris please call this function and set the token after the user signs in
        @token = token
    end
    
<<<<<<< HEAD
    def getOfficers
        @user = User.where('permissionLevel' => 'admin')
    end
    
    def getUsers
        @user = User.all
=======
    def getEmailFromToken(token)
        # chris please work on this function.
        return 'danwgun@gmail.com'
>>>>>>> b8f4cf9fd85ffb33e478e88e03cef5aadd06b698
    end
    
    def getUser(email)
        return User.where(email: email)
    end
    
<<<<<<< HEAD
    def login
        @user = User.all
=======
    def userExists(email)
        return User.exists?(email: email)
>>>>>>> b8f4cf9fd85ffb33e478e88e03cef5aadd06b698
    end
end
