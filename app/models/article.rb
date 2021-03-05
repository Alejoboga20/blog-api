class Article < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, :content, :slug, presence: true
end
