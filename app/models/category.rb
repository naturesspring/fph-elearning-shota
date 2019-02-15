class Category < ApplicationRecord
    validates :title, :description, presence: true
    has_many :words
end
