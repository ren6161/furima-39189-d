class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :user_name,             presence: true
  validates :last_name,             presence: true
  validates :first_name,            presence: true
  validates :last_name_kana,        presence: true
  validates :first_name_kana,       presence: true
  validates :birthday,              presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX =/\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }
  validates :first_name, format: { with: VALID_NAME_REGEX, message: 'Full-width characters.' }

  KATAKANA_REGEXP = /\A[ァ-ヶー]+\z/
  validates :last_name_kana, format: { with: KATAKANA_REGEXP }
  validates :first_name_kana, format: { with: KATAKANA_REGEXP }

end