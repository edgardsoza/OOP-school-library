require_relative '../classes/person'

describe Person do
  person1 = Person.new(15, 'Augusto')
  person2 = Person.new(15, 'Augusto', parent_permission: false)
  person3 = Person.new(15)
  person4 = Person.new(20, 'Augusto', parent_permission: false)
  context 'When testing the Person class' do
    it "Should return 'Unknown' if we check the name when instanciated only with age" do
      expect(person3.name).to eq 'Unknown'
    end
    it "Should return 'Augusto' if we check the name" do
      expect(person1.name).to eq 'Augusto'
    end
    it 'Should return 15 if we check the age' do
      expect(person1.age).to eq 15
    end
    it "Should return 0 if we check the person's rentals without any rental" do
      expect(person1.rentals.length).to eq 0
    end
    it "Should return true when checking parents' permission if instanciated without permission" do
      expect(person1.parent_permission).to eq true
    end
    it 'Should return true when checking use of service if instanciated without permission' do
      expect(person1.can_use_services?).to eq true
    end
    it "Should return false when checking parents' permission  if instanciated with permission as false" do
      expect(person2.parent_permission).to eq false
    end
    it 'Should return false when checking use of service if instanciated with permission as false and < 18' do
      expect(person2.can_use_services?).to eq false
    end
    it 'Should return true when checking use of service if instanciated with permission as false and +18' do
      expect(person4.can_use_services?).to eq true
    end
  end
end
