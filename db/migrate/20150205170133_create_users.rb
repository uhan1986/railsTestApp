class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :account, null: false                  # アカウント名
      t.string  :name                                  # 名前
      t.string  :email, null: false                    # Eメール
      t.string  :hashed_password                       # パスワード
      t.integer :permit_level, null: false             # 権限レベル
      t.integer :group_id, null: false	               # グループID
      t.boolean :deleted, null: false, default: false  # 削除フラグ
      t.boolean :suspended, null:false, default: false # 停止フラグ
      t.timestamps null: false
  end

  add_index :users, :account, unique: true
  add_index :users, :email, unique: true
  add_index :users, :group_id  
  #add_foreign_key グループID
  end
end
