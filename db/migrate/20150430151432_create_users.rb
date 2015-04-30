class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :address_line_four
      t.string :postcode

      t.timestamps
    end
  end
end
