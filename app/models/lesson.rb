class Lesson < ApplicationRecord
    belongs_to :category
    has_many :answers
    has_many :words, through: :answers
    has_many :choices, through: :answers

    def result 
       choices.where(correct: true).count
    end 
    
end
