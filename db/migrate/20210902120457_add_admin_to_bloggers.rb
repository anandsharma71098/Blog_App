class AddAdminToBloggers < ActiveRecord::Migration[6.1]
  def change
    add_column :bloggers, :admin, :boolean, default: false
  end
end
