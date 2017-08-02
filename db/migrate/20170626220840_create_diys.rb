class CreateDiys < ActiveRecord::Migration[5.0]
  def change
    create_table :diys do |t|
      t.string    :title
      t.text      :text
      t.binary    :image
      t.text      :video
      t.text      :title1
      t.text      :contents1
      t.binary    :image1
      t.text      :title2
      t.text      :contents2
      t.binary    :image2
      t.text      :title3
      t.text      :contents3
      t.binary    :image3
      t.text      :title4
      t.text      :contents4
      t.binary    :image4
      t.text      :prefecture
      t.text      :area
      t.text      :address
      t.text      :name
      t.text      :station
      t.text      :call
      t.text      :access
      t.text      :open
      t.text      :close
      t.text      :url
      t.text      :price
      t.text      :seat
      t.text      :private
      t.text      :tatami
      t.text      :smoke
      t.text      :parking
      t.text      :reserve
      t.text      :card
      t.text      :plus
      t.text      :category
      t.timestamps
    end
  end
end
