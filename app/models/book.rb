class Book < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "250x350#", thumb: "100x100#", tiny: "125x125>" }, default_url: "/images/book_:medium.jpeg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    belongs_to :category
    has_many :reviews
    belongs_to :user
end
