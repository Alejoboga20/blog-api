class Article < ApplicationRecord
    validates :title, uniqueness: true
    validates :title, :content, :slug, presence: true

    scope :recent, -> { order(created_at: :desc) }
end
