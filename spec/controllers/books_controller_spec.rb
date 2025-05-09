require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    before do
      @books = FactoryBot.create_list(:book, 3)
    end

    it "renders the index page with all book titles and authors" do
      get books_path
      expect(response).to have_http_status(:ok)

      @books.each do |book|
        expect(response.body).to include(book.title)
        expect(response.body).to include(book.author)
      end
    end
  end
  
end
