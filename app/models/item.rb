class Item < ApplicationRecord
  has_many :cart_itmes, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      image.attach(io: File.open(file_path), filename: 'noimage.png', content_type: 'image/png')
    end
    image
  end
end
