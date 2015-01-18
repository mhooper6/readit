class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.references :user, index: true
      t.references :board, index: true

      t.timestamps
    end
  end
end
