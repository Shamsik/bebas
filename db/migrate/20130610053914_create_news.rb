class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :author
      t.string :text
      t.datetime :time
    end
  end
end
