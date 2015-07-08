class AddTelefonoToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :telefono, :string
  end
end
