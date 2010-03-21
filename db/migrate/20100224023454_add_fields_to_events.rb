class AddFieldsToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :what, :string
    add_column :events, :description, :text
    add_column :events, :approved, :boolean, :default => false
    add_column :events, :when, :date
    add_column :events, :where, :string
    add_column :events, :speaker_id, :integer
  end

  def self.down
    remove_column :events, :what
    remove_column :events, :description
    remove_column :events, :approved
    remove_column :events, :when
    remove_column :events, :where
    remove_column :events, :speaker_id
  end
end
