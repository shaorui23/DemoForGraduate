class CreateRedisLists < ActiveRecord::Migration
  def change
    create_table :redis_lists do |t|
      t.string :name
      t.text :value

      t.timestamps
    end
  end
end
