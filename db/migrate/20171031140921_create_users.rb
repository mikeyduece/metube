class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :password_digest
      t.string :provider
      t.string :token
      t.string :token_expire

      t.timestamps
    end
  end
end
