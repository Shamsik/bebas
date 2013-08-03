class User < ActiveRecord::Base
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :login

  validates :login, :presence => true, 
                    :uniqueness => { case_sensitive: false },
                    :length => { :minimum => 3, :maximum => 25 },
                    :format => { :with => /\A[A-Za-z0-9_]+\z/ }

include Gravtastic
  gravtastic
  
end
