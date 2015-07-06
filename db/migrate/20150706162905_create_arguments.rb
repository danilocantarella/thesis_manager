class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.text :titolo
      t.text :descrizione
      t.integer :interessati
      t.string :tipologia
      t.string :stato

      t.timestamps
    end
  end
end
