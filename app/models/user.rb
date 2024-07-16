class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width katakana characters'}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width katakana characters'}
  validates :birthday, presence: true

  validate :password_complexity

  has_many :items
  has_many :orders

  def password_complexity
    if password.present?
      unless password.match(/^(?=.*[a-zA-Z])(?=.*\d).+$/)
        unless errors[:password].include?('is invalid. Include both letters and numbers.')
          errors.add :password, 'is invalid. Include both letters and numbers.'
        end
      end
    end
  end

end
