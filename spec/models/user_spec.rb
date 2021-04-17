require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザー登録が可能なとき' do
    it '全て入力されている時' do
      expect(@user).to be_valid
    end

    it 'gender_idが未選択でも登録できる' do
      @user.gender_id=0
      expect(@user).to be_valid
    end
    
    it 'genreが未記入でも登録できる' do
      @user.genre=""
      expect(@user).to be_valid
    end

    it 'genreが未記入でも登録できる' do
      @user.artist=""
      expect(@user).to be_valid
    end
  end

  context 'ユーザー登録が不可能な時' do
     
    it 'nicknameが空欄の時' do
      @user.nickname=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'instrumentが空欄の時' do
      @user.instrument=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Instrument can't be blank")
    end

    it 'prefecture_idが未選択の時' do
      @user.prefecture_id=0
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'history_idが未選択の時' do
      @user.history_id=0
      @user.valid?
      expect(@user.errors.full_messages).to include("History must be other than 0")
    end

    it 'ageが未記入の時' do
      @user.age=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end
    
    it 'ageが数字以外の時' do
      @user.age="aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Age 半角数字のみで入力してください")
    end

    it 'ageが全角数字の時' do
      @user.age="１２"
      @user.valid?
      expect(@user.errors.full_messages).to include("Age 半角数字のみで入力してください")
    end


  end



end
