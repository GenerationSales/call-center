class AddFieldsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :number, :string
    add_column :companies, :fax, :string
    add_column :companies, :website, :string
    add_column :companies, :employee_size, :integer
    add_column :companies, :revenue, :float
    add_column :companies, :street, :string
    add_column :companies, :city, :string
    add_column :companies, :county, :string
    add_column :companies, :state, :string
    add_column :companies, :zip, :string
    add_column :companies, :sic_code, :string
    add_column :companies, :industry, :string
  end
end
