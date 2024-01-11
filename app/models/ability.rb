# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, :all
    can %i[read update destroy], Group, user_id: user.id
    # can :destroy, Food, user_id: user.id
    # can :destroy, RecipeFood, recipe: { user_id: user.id }
  end
end
