class CreateHealthProviders < ActiveRecord::Migration
  def self.up
    create_table :health_providers do |t|
      t.integer :provider_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :hospital_referral_region_description
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :health_providers
  end
end
