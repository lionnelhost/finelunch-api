class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.date :period_start
      t.date :period_end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
