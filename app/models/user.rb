class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :instrument
    validates :prefecture_id,numericality: { other_than: 0 }
    validates :history_id,numericality: { other_than: 0 }
    validates :age, format:{with: /\A[0-9]+\z/,message:'半角数字のみで入力してください'}
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: '全て半角で英数字を混ぜて設定してください' }
  end
    
    has_many :movies
    belongs_to :prefecture
    belongs_to :history
    belongs_to :gender
    has_many :comments
    has_many :likes, dependent: :destroy

    has_many :user_rooms
    has_many :chats
    has_many :rooms, through: :user_rooms

      def already_liked?(movie)
        self.likes.exists?(movie_id: movie.id)
      end
end
