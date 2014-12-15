class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :title
      t.text :description
      t.string :exercises

      t.timestamps
    end
  end
end
