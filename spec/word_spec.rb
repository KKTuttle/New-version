require('rspec')
require('word')
require('definition')

describe(Word) do

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
end
