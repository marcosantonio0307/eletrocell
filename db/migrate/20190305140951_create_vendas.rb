class CreateVendas < ActiveRecord::Migration[5.2]
  def change
    create_table :vendas do |t|
      t.decimal :valor_total
      t.string :status

      t.timestamps
    end
  end
end