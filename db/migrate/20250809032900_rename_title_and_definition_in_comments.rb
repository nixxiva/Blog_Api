class RenameTitleAndDefinitionInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :title, :commenter
    rename_column :comments, :definition, :body
  end
end

