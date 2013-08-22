require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  attr_reader :birthday
  
  def assign_attributes(hash)
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @gender = hash[:gender]
    @birthday = hash[:birthday]
    @email = hash[:email]
    @phone = hash[:phone]
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def age
    now = Time.now.utc.to_date
    (now.year - @birthday.year - (@birthday.to_date.change(:year => now.year) > now ? 1 : 0))
  end

end

student = Student.new
student.assign_attributes(
      :first_name => "Happy",
      :last_name => "Gilmore",
      :gender => 'male',
      :birthday => Date.new(1970,9,1))
p student.name
p student.age