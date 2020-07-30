class CreateWebsiteSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :website_settings do |t|
      t.datetime :last_fetch
      t.boolean :success

      t.timestamps
    end
  end
end
