class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :image, styles: { tiny: "100x100#", medium: "300x300#" }, default_url: "/images/book_:medium.jpeg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_many :books
	has_many :reviews
end
