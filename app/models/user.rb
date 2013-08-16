class User < ActiveRecord::Base
  
  rolify
  
  after_create :set_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :login

  validates :login, :presence => true, 
                    :uniqueness => { case_sensitive: false },
                    :length => { :minimum => 3, :maximum => 25 },
                    :format => { :with => /\A[A-Za-z0-9_]+\z/ }

  include Gravtastic
    gravtastic

  private
  def set_role
   add_role :user
  end
  
end
