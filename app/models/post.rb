class Post < ApplicationRecord
  validates :title, presence: :true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :custom

  def custom
    unless title.include?("Won't Believe" || "Secret" || "Top" || "Guess")
      errors.add(:title, "invalid title")
    end
  end
end
