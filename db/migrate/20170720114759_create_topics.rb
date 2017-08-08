class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.text      :name
      t.binary    :image
      t.text      :tagname
      t.binary    :topvideo
      t.text      :post1
      t.binary    :video1
      t.text      :post2
      t.binary    :video2
      t.text      :post3
      t.binary    :video3
      t.text      :post4
      t.binary    :video4
      t.text      :post5
      t.binary    :video5
      t.text      :post6
      t.binary    :video6
      t.text      :post7
      t.binary    :video7
      t.text      :post8
      t.binary    :video8
      t.text      :post9
      t.binary    :video9
      t.text      :post10
      t.binary    :video10
      t.text      :post11
      t.binary    :video11
      t.text      :post12
      t.binary    :video12
      t.text      :post13
      t.binary    :video13
      t.text      :post14
      t.binary    :video14
      t.text      :post15
      t.binary    :video15
      t.text      :post16
      t.binary    :video16
      t.text      :post17
      t.binary    :video17
      t.text      :post18
      t.binary    :video18
      t.text      :post19
      t.binary    :video19
      t.text      :post20
      t.binary    :video20
      t.timestamps
    end
  end
end
