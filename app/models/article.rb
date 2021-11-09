class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 50}
    validates :description, presence: true, length: { minimum: 20, maximum: 1000}
end