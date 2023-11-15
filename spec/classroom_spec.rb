require_relative '../student'
require_relative '../classroom'

describe Classroom do
  let(:classroom_label) { 'Math' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new('John Doe', 16, classroom) }

  describe '#initialize' do
    it 'creates a new Classroom instance' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'sets the label correctly' do
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_an(Array)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom for the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the classroom' do
      expected_hash = {
        'label' => classroom_label,
        'students' => [student.id]
      }

      classroom.add_student(student)
      expect(classroom.to_h).to eq(expected_hash)
    end
  end
end
