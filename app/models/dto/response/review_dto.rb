class ReviewDto
  attr_accessor :reviewText, :rating, :reviewDate, :userName
  def initialize(reviewText:, rating:, reviewDate:, userName:)
    @reviewText = reviewText
    @rating = rating
    @reviewDate = reviewDate
    @userName = userName
  end
end
