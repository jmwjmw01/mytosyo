class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :update, User
      can :read, Book
      can :new, Book
      can :create, Book
      can :edit, Book
      can :destroy, Book
      can :get_info, Book
      can :manage, Rental
      cannot :read, Log
      cannot :destroy, Log
    end
  end
end
