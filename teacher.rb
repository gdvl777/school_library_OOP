require_relative 'person'

# Class representing a teacher
class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def to_h
    super.merge({
                  'specialization' => @specialization
                })
  end

  def can_use_services?
    true
  end
end
