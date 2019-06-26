class CreateRailsNotFounderRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :rails_not_founder_requests do |t|
      t.jsonb :headers, null: false
      t.string :method, null: false
      t.string :ip, null: false
      t.string :params, default: ""
      t.string :url, null: false

      t.timestamps
    end
  end
end
