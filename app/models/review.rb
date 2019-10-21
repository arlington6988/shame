class Review < ApplicationRecord
    has_one :business
    has_one :user
end
