class Ability
  include CanCan::Ability

  def initialize(worker)
    worker ||= Worker.new 
    if worker.has_role?(:admin)
      can :manage, Worker
      can :manage, Role
    end

    if worker.has_role?(:yunying)
      can :manage, City
      can :manage, Category
      can :manage, Product
      can :manage, Price
    end 

    if worker.has_role?(:fenchengshi)
      can :manage, User
      can :manage, Courier
      can :manage, Factory
      can :manage, PriceRule
    end

    can :change_current_city, Worker
  end
end
