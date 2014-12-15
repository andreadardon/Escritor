class AddIdToWeek < ActiveRecord::Migration
  def change
    add_reference :weeks, :id, index: true
  end
end
