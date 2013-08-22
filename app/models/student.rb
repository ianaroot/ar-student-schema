require_relative '../../db/config'
# require 'activerecord'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, format: { with: /[\w]+@[\w]+.[\w]{2,}.?[\w]*/, message: "email format must be valid" }
  validates :email, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 5 }
  validates :phone, format: { with: /\A\(?\d{3}\)?[\s-]?\d{3}-?\d{4}\s?x?\d*\z/, message: "phone number must be valid"}

  def age
    now = Date.today
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def fill_name
    self[:name] = "#{self.first_name} #{self.last_name}"
    self.save
  end

  def self.fill_name
    self.all.map! do |row|
      row.fill_name
    end
  end
end



Student.create(name: "Sam Bee")
