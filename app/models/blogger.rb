class Blogger < ApplicationRecord
  before_save {self.email=email.downcase}
  has_many :articles, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 

    validates :email, presence: true, 
                        uniqueness: true, length: {maximum: 105}, format: {with: VALID_EMAIL_REGEX}

  # VALID_PASSWORD_REGEX = /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%&-+=()])(?=\\S+).{8, 20}/i 

  #   validates :encrypted_password, presence: true, 
  #                       uniqueness: true, length: {maximum: 105}, format: {with: VALID_PASSWORD_REGEX}                    


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
