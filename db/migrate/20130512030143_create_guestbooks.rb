class CreateGuestbooks < ActiveRecord::Migration
  def change
    create_table :guestbooks do |t|

      t.string :author
      t.string :email
      t.text :message
      t.datetime :time

    end
  end
end
