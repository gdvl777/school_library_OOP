require_relative '../person'

describe Person do
  context 'Testing instatiation with arguments' do
    before(:each) do
      @person = Person.new('Severus', 65)
    end
    it 'Should have attribute :name' do
      expect(@person).to have_attributes(name: 'Severus')
    end

    it 'Should have attribute :age' do
      expect(@person).to have_attributes(age: 65)
    end

    it 'Should have attribute :name set to "Severus"' do
      expect(@person.name).to eq('Severus')
    end

    it 'Should have attribute :age set to 65' do
      expect(@person.age).to eq(65)
    end
  end

  context 'Testing instatiation without arguments' do
    before(:each) do
      @person = Person.new
    end

    it 'Should have attribute :name set to "no-name-registered"' do
      expect(@person.name).to eq('no-name-registered')
    end

    it 'Should have attribute :age set to "Unknown"' do
      expect(@person.age).to eq('Unknown')
    end

    it 'Should have attribute :id set to a random number between 1 and 1000' do
      expect(@person.id).to be_between(1, 1000)
    end

    it 'Should have attribute :parent_permission set to true' do
      person_parent_permission = @person.instance_variable_get(:@parent_permission)

      expect(person_parent_permission).to eq(true)
    end
  end

  context "Testing Person's methods" do
    before(:each) do
      @person = Person.new('Severus', 65)
    end

    it 'Should return a hash with the correct attributes when calling to_h' do
      person_hash = @person.to_h

      expected_hash = {
        'id' => @person.id,
        'name' => 'Severus',
        'age' => 65,
        'parent_permission' => true
      }

      expect(person_hash).to eq(expected_hash)
    end
  end
end
