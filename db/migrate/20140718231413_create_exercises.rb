class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :body
      t.references :course, index: true

      t.timestamps
    end
  end
end
