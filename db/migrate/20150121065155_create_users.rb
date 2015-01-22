class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :age
      t.string :gender
      t.string :password, null:false
      t.references :role, index: true, null: false
      t.timestamps null: false
    end
  end
end
