class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.string :sentiment
      t.decimal :score

      t.timestamps
    end
  end
end
