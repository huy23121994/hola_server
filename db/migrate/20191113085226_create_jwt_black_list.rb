class CreateJwtBlackList < ActiveRecord::Migration[5.2]
  def change
    create_table :jwt_blacklist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_blacklist, :jti

    add_column :users, :jti, :string
    change_column_null :users, :jti, false
    add_index :users, :jti, unique: true
  end
end
