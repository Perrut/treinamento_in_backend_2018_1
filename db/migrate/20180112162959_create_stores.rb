class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :address
      t.integer :cnpj
      t.integer :telephone
      t.string :razao_social

      t.timestamps
    end
  end
end
