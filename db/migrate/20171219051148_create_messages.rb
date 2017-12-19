class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id  #이 놈은 정수값이니까.

      t.timestamps null: false
    end
  end
end
