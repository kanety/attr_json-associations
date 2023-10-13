class CreateTestTables < ActiveRecord::Migration::Current
  def change
    create_table :groups do |t|
      t.text :name
      t.jsonb :data
      t.timestamps
    end

    create_table :users do |t|
      t.text :name
      t.jsonb :data
      t.timestamps
    end
  end
end
