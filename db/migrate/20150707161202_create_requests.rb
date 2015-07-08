class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :stato
      t.integer :student_id
      t.integer :argument_id

      t.timestamps
    end
  end
end
