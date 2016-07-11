class Word
  attr_reader(:word, :definitions, :id)
  @@words = []

  define_method(:initialize) do |attributes|
    @word = attributes[:word]
    @definitions = []
    @id = @@words.length + 1
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:add_definition) do |definition|
    new_defin = Definition.new({:definition => definition})
    @definitions.push(new_defin)
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id)
        found_word = word
      end
    end
    found_word
  end
end
