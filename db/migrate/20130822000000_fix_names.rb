require_relative '../config'


class FixNames < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.string :name
    end
  end
end
