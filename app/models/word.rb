class Word < ApplicationRecord
    validates :content, presence: true,
    uniqueness: {case_sensitive: false }
    
    belongs_to :category

end
