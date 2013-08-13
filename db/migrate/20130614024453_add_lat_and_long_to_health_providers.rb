class AddLatAndLongToHealthProviders < ActiveRecord::Migration
  def change
    add_column :health_providers, :latitude, :float
    add_column :health_providers, :longitude, :float
  end
end
