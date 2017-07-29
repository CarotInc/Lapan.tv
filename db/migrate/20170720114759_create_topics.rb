class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.text      :name
      t.binary    :image
      t.text      :tagname
      t.text      :post1
      t.text      :post2
      t.text      :post3
      t.text      :post4
      t.text      :post5
      t.text      :post6
      t.text      :post7
      t.text      :post8
      t.text      :post9
      t.text      :post10
      t.text      :post11
      t.text      :post12
      t.text      :post13
      t.text      :post14
      t.text      :post15
      t.text      :post16
      t.text      :post17
      t.text      :post18
      t.text      :post19
      t.text      :post20
      t.timestamps
    end
  end
end
