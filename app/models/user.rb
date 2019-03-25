class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {:case_sensitive => false}
  validates :password, presence: true, length: { minimum: 6}

  # before_save :downcase_fields

  # def downcase_fields
  #   self.email.downcase!
  # end

  def self.authenticate_with_credentials(email,password)
      #user is successfully authenticated
    if user = User.where("LOWER(email) LIKE?", email.strip.downcase).first.try(:authenticate,password)
      user
    else
      nil
    end
  end

end
