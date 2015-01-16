class AddActionsToRequests < ActiveRecord::Migration
  def change
  	add_column :requests, :actions, :boolean	
  end
end
