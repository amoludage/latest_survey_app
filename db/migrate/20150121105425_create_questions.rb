class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.references :survey, index: true
      t.timestamps null: false
    end
  end
end
