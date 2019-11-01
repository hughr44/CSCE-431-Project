class UserController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :permissionLevel, :linkedInUrl)
    end
    
    def new
        @user = User.new
    end

    def index
        @users = User.all
        puts "users:"
        puts @users
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
            User.create(email: params['email'], permissionLevel: params['permissionLevel'], linkedInUrl: params['linkedInUrl'])
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
    
    def getEmailFromToken(token)
        # chris please work on this function.
        return session[:userinfo].fetch("info").fetch("email")
    end
    
    def getUser(email)
        return User.where(email: email)
    end
    
    def userExists(email)
        return User.exists?(email: email)
    end
end
