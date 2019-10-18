class User < ActiveRecord::Base
    
    def initialize(email, perm,linkedin)
        @email = email
        @permissionLevel = permissionLevel
        @linkedInUrl = linkedInUrl
    end
    
    #GETTER
    def id
        @id
    end
    
    def email
        @email
    end
    
    def linkedin
        @linkedin
    end
    
    #SETTER
    def id=(id)
        @id = id
    end
    
    def email=(email)
        @email = email
    end
    
    def linkedin=(linkedin)
        @linkedin = linkedin
    end
    
    
end