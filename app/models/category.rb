class Category < ApplicationRecord
    validates :title, :description, presence: true
    has_many :words, dependent: :destroy
    has_many :lessons

end
