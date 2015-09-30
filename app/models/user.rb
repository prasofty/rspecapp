class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    def get_info
        {
            email: self.email,
            created_at: self.created_at,
            updated_at: self.updated_at
        }
    end
end
