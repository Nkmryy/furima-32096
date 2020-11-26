class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true,
            format: {with: /\A[\w]+\z/, message: '英字と数字の両方を含めて設定してください' }
  validates :nickname, presence: true
  validates :birth_date, presence: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
