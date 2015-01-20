class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.references :user, index: true
      t.references :board, index: true

      t.timestamps
    end
  end
end
