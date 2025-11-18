class ShopDataInitDto
  DEFAULT_GENRES = [
    GenreDto.new(genre_id: 1, name: "Fiction").freeze,
    GenreDto.new(genre_id: 2, name: "Non-Fiction").freeze,
    GenreDto.new(genre_id: 3, name: "Science Fiction").freeze,
    GenreDto.new(genre_id: 4, name: "Fantasy").freeze,
    GenreDto.new(genre_id: 5, name: "Biography").freeze
  ]
  attr_accessor :categoryResponseDTOs, :genreResponseDTOs
  def initialize(categoryResponseDTOs: [], genreResponseDTOs: DEFAULT_GENRES)
    @categoryResponseDTOs = categoryResponseDTOs
    @genreResponseDTOs = genreResponseDTOs
  end
end
