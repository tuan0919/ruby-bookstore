class GenreDto
  attr_accessor :genre_id, :name
  def initialize(genre_id:, name:)
    @genre_id = genre_id
    @name = name
  end
end
