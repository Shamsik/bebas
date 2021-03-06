class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :update, :all
    elsif user.has_role? :user
      can :read, :all
    end
  end
end
