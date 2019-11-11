class UserController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :permissionLevel, :linkedInUrl)
    end
    
    def new
        @user = User.new
    end

    def show
        session['redirect_url'] = '/user'
        redirect_to '/login'
        
        @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
        
        @users = User.all
    end

    def create
        if (userExists(params['email']))
            return
        end
        
        if (!params.has_key?('permissionLevel'))
            params['permissionLevel'] = 'member'
        end
        
        requester = getUser(requester_email)
        
        if((params['permissionLevel']=='admin' && requester.permissionLevel=='admin') || params['permissionLevel']=='member') 
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
    
    def getUser(email)
        return User.where(email: email)
    end
    
    def userExists(email)
        return User.exists?(email: email)
    end
end
