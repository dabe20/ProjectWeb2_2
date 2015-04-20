class AddVisitsCountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :visits_count, :integer
  end
end
