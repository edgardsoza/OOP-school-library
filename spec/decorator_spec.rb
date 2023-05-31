require_relative '../classes/decorator'

describe Decorator do
  context 'Test the Decorator class' do
    decorator = Decorator.new(Nameable.new)
    it 'create an instance object of decorator' do
      expect(decorator).to be_instance_of(Decorator)
    end
    it 'correct_name method expected to raise an error' do
      expect {decorator.correct_name}.to raise_error("Subclasses must implement correct_name method", NotImplementedError)
    end
  end
end
