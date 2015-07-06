class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :matricola
      t.string :encrypted_password
      t.string :salt
      t.timestamps
    end
  end
end
