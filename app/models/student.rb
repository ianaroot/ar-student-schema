require_relative '../../db/config'
# require 'activerecord'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, format: { with: /\A[\w]+@[\w]+.[\w]{2,}.?[\w]*\z/, message: "email format must be valid" }
  validates :email, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 5 }
  validates :phone, format: { with: /\A\(?\d{3}\)?[\s-]?\d{3}-?\d{4}\s?x?\d*\z/, message: "phone number must be valid"}


  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def validate_email

  end
end

student = Student.new
student.assign_attributes(
      :first_name => "Happy",
      :last_name => "Gilmore",
      :email => "happy@gilmore.com",
      :gender => 'male',
      :birthday => Date.new(1970,9,1))
p student.valid?

student2 = Student.new
student2.assign_attributes(
      :first_name => "Dave",
      :last_name => "Grohl",
      :email => "happy@gilmore.com",
      :gender => 'male',
      :birthday => Date.new(1939,1,3))
p student2.valid?

student3 = Student.new
student3.assign_attributes(
      :first_name => "Trey",
      :last_name => "Anastasio",
      :email => "trey@phish.com",
      :gender => 'male',
      :birthday => Date.new(1912,1,3))
p student3.valid?