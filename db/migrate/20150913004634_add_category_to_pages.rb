class AddCategoryToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :category, index: true
    add_foreign_key :pages, :categories
  end
end
