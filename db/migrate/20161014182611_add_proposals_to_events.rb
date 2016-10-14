class AddProposalsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :proposal, foreign_key: true
  end
end
