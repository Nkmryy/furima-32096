class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
            format: {with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
  validates :nickname, presence: true
  validates :birth_date, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
