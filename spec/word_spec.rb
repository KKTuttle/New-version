require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#word") do
    it ("returns an inputted word") do
      test_word = Word.new({:word => "stock"})
      expect(test_word.word).to(eq("stock"))
      expect(test_word.id).to(eq(1))
    end
  end

  describe('.all') do
    it "is empty at the beginning" do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it "saves the inputted word" do
      test_word=Word.new({:word => 'Stock'})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it "clears out all the saved words" do
      test_word = Word.new({:word => 'Stock'}).save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#add_definition") do
    it "adds a definition to the word" do
      test_word = Word.new({:word => 'Stock'})
      test_word.add_definition("A  stock is a type of security that signifies ownership in a corporation and represents a claim on part of the corporation's assets and earnings.")
      expect(test_word.definitions[0].defin).to(eq("A  stock is a type of security that signifies ownership in a corporation and represents a claim on part of the corporation's assets and earnings."))
    end
  end
  
  describe(".find") do
    it("looks up and returns a word if it exists") do
      test_word = Word.new({:word => "Stock"})
      test_word.save()
      test_word2 = Word.new({:word => 'Option'})
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
