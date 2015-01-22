class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :description, null: false
      t.references :question, index: true, null: false
      t.timestamps null: false
    end
  end
end
