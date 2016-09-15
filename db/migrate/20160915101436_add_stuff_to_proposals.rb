class AddStuffToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :url, :string
    add_reference :proposals, :user, foreign_key: true
  end
end
