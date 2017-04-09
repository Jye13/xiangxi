class AddDisplayNameAndCommentToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :display_name, :string
    add_column :roles, :comment, :string
  end
end
