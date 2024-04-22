require 'rails_helper'

RSpec.describe BookService do
  describe '#get_book' do
    it 'returns book given a book title', :vcr do
      service = BookService.new

     book = service.get_book("the+lord+of+the+ring", 5)
      # require 'pry'; binding.pry
      expect(book).to be_a(Hash)
    end
  end
end