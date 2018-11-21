class AddTimestampsSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :created_at, :datetime, null: false
    add_column :subs, :updated_at, :datetime, null: false
  end
end
