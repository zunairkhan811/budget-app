class User < ApplicationRecord
    has_many :groups dependent: :destroy
    has_many :foods dependent: :destroy
end
