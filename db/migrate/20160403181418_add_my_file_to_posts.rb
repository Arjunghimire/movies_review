class AddMyFileToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :my_file, :string
  end
end
