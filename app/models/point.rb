class Point < ApplicationRecord
    belongs_to :user

    validates :points, {presence: true, numericality: { only_integer: true }}
end
