class Definition
  attr_reader(:defin)

  define_method(:initialize) do | attributes |
    @defin = attributes[:definition]
  end
end
