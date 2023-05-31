require_relative '../classes/classroom'

describe Classroom do
  context 'Testing the Classroom class' do
    it 'Testing that classroom class creates a new classroom' do
      classroom = Classroom.new('Python')
      expect(classroom.label).to eq 'Python'
      expect(classroom.students).to eq []
    end
  end

  context 'Testing that Classroom add_student method is working' do
    it 'Adding students to the classroom' do
      classroom = Classroom.new('Python')
      classroom.students.push('Student1', 'Student2', 'Student3')
      expect(classroom.students.length).to eq 3
    end
  end
end
