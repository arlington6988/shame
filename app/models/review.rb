class Review < ApplicationRecord
    belongs_to :business
    belongs_to :user
end
