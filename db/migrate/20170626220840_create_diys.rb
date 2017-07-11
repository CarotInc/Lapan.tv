class CreateDiys < ActiveRecord::Migration[5.0]
  def change
    create_table :diys do |t|
      t.string    :title
      t.text      :text
      t.binary    :image
      t.binary    :video
      t.text      :contents
      t.timestamps
    end
  end
end
