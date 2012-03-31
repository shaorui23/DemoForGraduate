class CreateRedisStrings < ActiveRecord::Migration
  def change
    create_table :redis_strings do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
