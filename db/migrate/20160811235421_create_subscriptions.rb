class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.references :person, foreign_key: true
      t.references :mailing_list, foreign_key: true

      t.timestamps
    end
  end
end
