class CreateProposals < ActiveRecord::Migration[5.0]
  def change
    create_table :proposals do |t|
      t.string :subject
      t.text :content
      t.string :location
      t.integer :price
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
