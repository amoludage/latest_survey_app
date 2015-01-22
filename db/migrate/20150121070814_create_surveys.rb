class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.string :survey_type
      t.date :conducted_on, null: false
      t.integer :number_of_people
      t.timestamps null: false
    end
  end
end
