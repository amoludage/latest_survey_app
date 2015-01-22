class DeleteRemoveDuplicateRoleTable < ActiveRecord::Migration
  def change
    drop_table(:remove_duplicate_role_from_users)
  end
end
