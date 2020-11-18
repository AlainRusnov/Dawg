class AddSizeToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :size, :string
  end
end
