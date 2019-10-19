class User < ActiveRecord::Base
    
    def email
        @email
    end
    
    def permissionLevel
        @permissionLevel
    end
    
    def linkedInUrl
        @linkedin
    end
    
    def email=(email)
        @email = email
    end
    
    def permissionLevel=(permissionLevel)
        @permissionLevel = permissionLevel
    end
    
    def linkedInUrl=(linkedInUrl)
        @linkedInUrl = linkedInUrl
    end
    
end
