class Product < ApplicationRecord
    validates :title, :description, :image_url, presence: true 
    validates :price, numericality: { greater_than_or_equal_to: 100.0 }
    validates :image, allow_blank: true, format: {
      with:   %r{\.(gif\jpg\png)\Z}i,
      message: 'must be a url for GIF, JPG or PNG image.'
    }
end
