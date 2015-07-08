class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.string :ufficio
      t.string :telefono

      t.timestamps
    end
  end
end
