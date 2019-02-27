class Word < ApplicationRecord
    belongs_to :category
    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices
    validates :content, presence: true,
    uniqueness: {case_sensitive: false }

    Word.count

    def correct_answer
        choices.find_by(correct: true)
    end
end
