class AddIndexToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :attendee_id, :integer
    add_column :invites, :attended_event_id, :integer
  end
end
