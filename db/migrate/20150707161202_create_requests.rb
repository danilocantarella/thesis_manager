class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :stato
      t.integer :id_student
      t.integer :id_argument

      t.timestamps
    end
  end
end
