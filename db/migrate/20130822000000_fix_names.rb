require_relative '../config'

class FixNames < ActiveRecord::Migration
  def up
    add_column :students, :name, :string

    Student.all.each do |s|
      s.name = [s.first_name, s.last_name].join(' ')
      s.save!
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name
    add_column :students, :last_name

    Student.all.each do |s|
      s.first_name, s.last_name = s.name.split(' ', 2)
      s.save!
    end

    remove_column :students, :name, :string
  end
end