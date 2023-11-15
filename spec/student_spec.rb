require_relative '../student'
require_relative '../classroom'
describe Student do
  let(:classroom_label) { 'Math' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student_name) { 'John Doe' }
  let(:student_age) { 16 }

  describe '#initialize' do
    it 'creates a new Student instance' do
      student = Student.new(student_name, student_age, classroom)
      expect(student).to be_an_instance_of(Student)
    end

    it 'sets the name, age, and classroom correctly' do
      student = Student.new(student_name, student_age, classroom)
      expect(student.name).to eq(student_name)
      expect(student.age).to eq(student_age)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom for the student' do
      student = Student.new(student_name, student_age, classroom)
      new_classroom = Classroom.new('Science')

      student.classroom = new_classroom

      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end
  describe '#to_h' do
    it 'returns a hash representation of the student' do
      student = Student.new(student_name, student_age, classroom)

      expected_hash = {
        'name' => student_name,
        'age' => student_age,
        'parent_permission' => true,
        :classroom => classroom&.label, # Use safe navigation to avoid nil errors
        'id' => student.id # This is the id of the student, not the classroom id
      }
      expect(student.to_h).to eq(expected_hash)
    end
  end
end
