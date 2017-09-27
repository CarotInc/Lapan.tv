class CreateDiys < ActiveRecord::Migration[5.0]
  def change
    create_table :diys do |t|
      t.string    :title
      t.text      :text
      t.binary    :image
      t.binary    :movie
      t.binary    :movie2
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
      t.text      :title5
      t.text      :contents5
      t.binary    :image5
      t.text      :prefecture
      t.text      :area
      t.text      :address
      t.text      :name
      t.text      :station
      t.text      :call
      t.text      :access
      t.text      :open
      t.text      :close
      t.text      :tabelog
      t.text      :instagram
      t.float     :latitude
      t.float     :longitude
      t.timestamps
    end
  end
end
