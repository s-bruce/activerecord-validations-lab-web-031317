class Post < ActiveRecord::Base
	validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity?

  def clickbaity?
    unless title =~ /Won't Believe|Secret|Top \d|Guess/i
      errors.add(:title, "title is not clickbaity")
    end
  end


end