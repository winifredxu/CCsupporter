class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :dept
      t.text :body

      t.timestamps null: false
    end
  end
end
