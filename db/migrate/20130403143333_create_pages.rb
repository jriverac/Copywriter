class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :project_id
      t.string :title
      t.text :body
      t.integer :parent
      t.integer :order

      t.timestamps
    end
  end
end
