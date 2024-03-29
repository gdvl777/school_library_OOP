require_relative 'person'

# Class representing a student
class Student < Person
  attr_reader :classroom

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def to_h
    super.merge({
                  classroom: @classroom&.label # Cambiado para evitar la recursividad
                })
  end
end
