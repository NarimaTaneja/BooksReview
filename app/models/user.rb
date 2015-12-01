class User < ActiveRecord::Base
	has_secure_password
	has_attached_file :image, styles: { tiny: "100x100#", medium: "300x300#" }, default_url: "/images/book_:medium.jpeg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_many :books
	has_many :reviews
	before_create { generate_token(:auth_token)}

	def generate_token(column)
		begin 
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])	 
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def admin?
		self.role == 'admin'
	end
end
