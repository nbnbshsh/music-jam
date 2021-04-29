class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]

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
    has_many :active_relationships,class_name: 'Follow', foreign_key: 'user_id'
    has_many :passive_relationships,class_name: 'Follow', foreign_key: 'target_user_id'
    has_many :followings, through: :active_relationships, source: :target_user
    has_many :followers, through: :passive_relationships, source: :user
    has_many :sns_credentials

      def already_liked?(movie)
        self.likes.exists?(movie_id: movie.id)
      end

      def self.from_omniauth(auth)
        sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
        user = User.where(email: auth.info.email).first_or_initialize(
          nickname: auth.info.name,
            email: auth.info.email
        )

        if user.persisted?
          sns.user = user
          sns.save
        end
        { user: user, sns: sns }

      end
end
