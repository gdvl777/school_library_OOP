require_relative '../teacher'

describe Teacher do
  context 'Testing instantiation' do
    before(:each) do
      @teacher = Teacher.new('Albus', 190, 'HeadMaster')
    end

    it 'Should have attribute :name' do
      expect(@teacher).to have_attributes(name: 'Albus')
    end

    it 'Should have attribute :age' do
      expect(@teacher).to have_attributes(age: 190)
    end

    it 'Should have attribute :specialization' do
      expect(@teacher).to have_attributes(specialization: 'HeadMaster')
    end
  end

  context "Testing Teacher's methods" do
    before(:each) do
      @teacher = Teacher.new('Albus', 190, 'HeadMaster')
    end

    it 'Overrides the superclass to_h method and includes specialization in the returned hash' do
      teacher_hash = @teacher.to_h

      expected_hash = {
        'id' => @teacher.id,
        'name' => 'Albus',
        'age' => 190,
        'parent_permission' => true,
        'specialization' => 'HeadMaster'
      }

      expect(teacher_hash).to eq(expected_hash)
    end

    it 'Should return true when calling can_use_services?' do
      teacher_can_use_services = @teacher.can_use_services?

      expect(teacher_can_use_services).to be_truthy
    end
  end
end
