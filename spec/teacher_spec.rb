require_relative '../classes/teacher'

describe Teacher do
  teacher = Teacher.new('Math', 34, 'Jane Doe', id: 1)

  context 'Testing the Teacher class' do
    it 'creating an instance of the Teacher class' do
      expect(teacher).to be_instance_of(Teacher)
    end
  end

  context 'Test the to_json method in Teacher' do
    it 'passes the info as a json format to store' do
      expect(teacher.to_json).to eq('{"json_class":"Teacher",'\
                                    '"data":{"id":1,"age":34,"name":"Jane Doe",'\
                                    '"specialization":"Math"}}')
    end
  end
end
