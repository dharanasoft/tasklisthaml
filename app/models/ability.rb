class Ability
  include CanCan::Ability

  def initialize(user)
    can :index, Bucket do |bucket|
      bucket.user.id == user.id
    end
    can :new, Bucket do |bucket|
      bucket.user.id == user.id
    end

    can :create, Bucket do |bucket|
      bucket.user.id == user.id
    end
    can :completed, Bucket do |bucket|
      bucket.user.id == user.id
    end

    can :complete, Task do |task|
      task.user.id == user.id
    end

  end
end
