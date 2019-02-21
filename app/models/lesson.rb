class Lesson < ApplicationRecord
    belongs_to :category
    has_many :answers
    has_many :words, through: :answers
    
end
