class UserController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :permissionLevel, :linkedInUrl)
    end
    
    def new
        @user = User.new
    end
    
    def show
        # reset_session
        if (session.has_key?('logged_in'))
            @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
            @debug = "logged in"
            return
        end
        @debug = "not logged in"
        
        session['redirect_url'] = '/user'
        redirect_to '/login'
    end

    # def index
    #     @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
    #     @users = User.all
    # end

    def create
        @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
        
        if (userExists(params['email']))
            return
        end
        
        if (!params.has_key?('permissionLevel'))
            params['permissionLevel'] = 'member'
        end
        
        if (@logged_in_user.permissionLevel == 'officer')
            User.create(email: params['email'], permissionLevel: params['permissionLevel'], linkedInUrl: params['linkedInUrl'])
        end
        
        redirect_to '/user'
    end
    
    def destroy
        @logged_in_user = getUser(session[:userinfo].fetch("info").fetch("email"))
        user = getUser(params['email'])
        
        if (@logged_in_user.email == user.email || @logged_in_user.permissionLevel == 'officer') 
            user.destroy
        end
        
        redirect_to '/user'
    end
    
    def getUser(email)
        return User.where(email: email).first
    end
    
    def userExists(email)
        return User.exists?(email: email)
    end
end
