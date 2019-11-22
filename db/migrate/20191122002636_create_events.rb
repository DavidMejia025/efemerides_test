class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :fecha
      t.string :date
      t.string :texto
      t.string :string
      t.string :url_imagen
      t.integer :category_id

      t.timestamps
    end
  end
end
