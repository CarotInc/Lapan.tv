class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|

      t.timestamps
    end
  end
end
