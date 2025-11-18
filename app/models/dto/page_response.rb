class PageResponse
  attr_reader :content, :last, :totalElements, :totalPages, :size, :number, :first, :numberOfElements, :empty
  def initialize(content:, last:, totalElements:, totalPages:, size:, number:, first:, numberOfElements:, empty:)
    @content = content
    @last = last
    @totalElements = totalElements
    @totalPages = totalPages
    @size = size
    @number = number
    @first = first
    @numberOfElements = numberOfElements
    @empty = empty
  end
end
