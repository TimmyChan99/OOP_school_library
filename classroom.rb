class Classroom
	attr_accessor :label
	attr_reader :students

	def initialize(label)
		@label = label
		@studends = []
	end

	def add_student(student)
		@studends.push(student)
		student.classroom = self
	end
end
