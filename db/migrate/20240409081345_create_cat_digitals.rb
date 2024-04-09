class CreateCatDigitals < ActiveRecord::Migration[6.1]
  def change
    create_table :cat_digitals do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
