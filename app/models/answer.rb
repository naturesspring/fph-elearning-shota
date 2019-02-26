class Answer < ApplicationRecord
    belongs_to :choice
    belongs_to :word
    belongs_to :lesson

    def your_answer
        choice.find_by([:choice_id])
    end
    
end
