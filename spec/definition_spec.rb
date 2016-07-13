require('rspec')
require('word')
require('definition')

describe(Definition) do
  describe("#definition") do
    it "returns an inputted definition" do
      test_definition = Definition.new({:definition => "A  stock is a type of security that signifies ownership in a corporation and represents a claim on part of the corporation's assets and earnings."})
      expect(test_definition.defin).to(eq("A  stock is a type of security that signifies ownership in a corporation and represents a claim on part of the corporation's assets and earnings."))
    end
  end
end
