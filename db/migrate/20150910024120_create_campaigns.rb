class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.text :name
      t.integer :company_id
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
