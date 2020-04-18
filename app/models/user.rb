class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Only allows submissions that have a name attribute
  validates_presence_of :name

  # 'Self' is the user; 'split' cuts the string
    def first_name
      self.name.split.first
    end
    
    def last_name
      self.name.split.last
    end

end
