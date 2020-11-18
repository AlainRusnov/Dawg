class AddAgeToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :age, :integer
  end
end
