class AddCategoryIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column(:tasks, :category_id, :integer, index: true)
  end
end
