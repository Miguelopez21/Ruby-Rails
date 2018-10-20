class User < ApplicationRecord
    has_many :posts
    validates :name, presence: true

    before_create ->{ self.token = generate_token }
    
    private 
    def generate_token
        loop do 
            pre_token=SecureRandom.hex
            return pre_token unless User.exists?({token: pre_token})
        end
    end 
    
        
end
