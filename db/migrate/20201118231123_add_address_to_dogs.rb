class AddAddressToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :address, :string
  end
end
