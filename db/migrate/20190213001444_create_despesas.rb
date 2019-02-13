class CreateDespesas < ActiveRecord::Migration[5.2]
  def change
    create_table :despesas do |t|
      t.string :tipo
      t.text :descricao
      t.decimal :valor

      t.timestamps
    end
  end
end
