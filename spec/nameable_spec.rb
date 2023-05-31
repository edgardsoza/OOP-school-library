require_relative '../classes/nameable'

describe Nameable do
  nameable = Nameable.new
  context 'Test the Nameable class' do
    it 'create an instance object of Nameable' do
      expect(nameable).to be_instance_of(Nameable)
    end
    it 'correct_name method expected to raise an error' do
      expect do
        nameable.correct_name
      end.to raise_error("Subclasses must implement correct_name method", NotImplementedError)
    end
  end
end
