class EnrollmentRepository
  include Load

  def initialize
    @enrollments = []
  end

  def find_by_name(input)
    name = input.downcase
    @district << @student_repository.find_all { |entry| entry.send(:location) == name.upcase}
  end

end
