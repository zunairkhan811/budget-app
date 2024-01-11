# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can %i[read edit update destroy], Group, user_id: user.id
  end
end
