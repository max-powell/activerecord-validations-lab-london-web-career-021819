class Post < ActiveRecord::Base
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :post_title_must_be_clickbaity

  def post_title_must_be_clickbaity
    clickbait = /Won't Believe|Secret|Top\d+|Guess/i
    unless clickbait.match(title)
      errors.add(:title, 'must be clickbaity')
    end
  end
end
