class CreateWives < ActiveRecord::Migration
  def change
    create_table :wives do |t|
      t.references :husband
      t.timestamps null: false
    end
  end
end
