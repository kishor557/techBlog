class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "super-admin"
      can :manage, :all
		else
       can [:read], :blog
		end
  end
  
end
