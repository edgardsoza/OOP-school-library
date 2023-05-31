require_relative '../classes/book'

describe Book do
    book = Book.new('Iliada', 'Homer', id: 1)
    context "Testing the Book class" do

        it "The initialize method should create a book with title and author" do
            expect(book.title).to eq 'Iliada'
            expect(book.author).to eq 'Homer'
        end
        it "The method rentals returns a length of three after adding three rentals to the book" do
            book.rentals.push('rental', 'rental', 'rental')
            expect(book.rentals.length).to eq 3
        end
    end
    context "Testing Book class serializing and deserializing" do
        book_json = book.to_json;
        book_object = JSON.parse(book_json, create_additions: true)
        it "Converting to JSON when using Book.to_json" do
            expect(book_json).to eq "{\"json_class\":\"Book\",\"id\":1,\"title\":\"Iliada\",\"author\":\"Homer\"}"
        end
        it "Converting JSON to ruby objects" do
            expect(book_object.id).to eq book.id 
        end
    end
end
