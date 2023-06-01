require_relative '../classes/student'

describe Student do
  student = Student.new(18, 'John Doe', id: 1)

  context 'Testing the Student class' do
    it 'creating an instance of the Student class' do
      expect(student).to be_instance_of(Student)
    end
  end

  context 'Test the to_json method in Student' do
    it 'passes the info as a json format to store' do
      expect(student.to_json).to eq('{"json_class":"Student",' \
                                    '"data":{"id":1,"age":18,"name":"John Doe",' \
                                    '"classroom":null,"parent_permission":true}}')
    end
  end
end
