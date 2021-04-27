class ChatsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user= User.find(params[:id])
    rooms=current_user.user_rooms.pluck(:room_id)
    user_rooms= UserRoom.find_by(user_id: @user.id,room_id: rooms)

    if user_rooms.nil?
      @room=Room.new
      @room.save

      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end

    @chats=@room.chats
    @chat=Chat.new(room_id: @room.id)
  end

  def create
    @chat=current_user.chats.new(chat_params)
    if @chat.save
      ActionCable.server.broadcast 'chat_channel',content: @chat
    end
  end

  def index
   
    user_rooms=UserRoom.where(user_id: params[:user_id])
    a=[]
    user_rooms.each do |user_room|
      a.push(user_room.room_id)
    end

    b=[]
    a.each do |r_id|
    chat_user=UserRoom.where(room_id: r_id).where.not(user_id: params[:user_id])
    b.push(chat_user)
    end
    
    array_nums=b.size
    c=[]
    array_nums.times do |num|
    chat_user_ids=b[num][0].user_id
    c.push(chat_user_ids)
    end
    
    d=[]
    c.each do|user_id|
    user=User.find(user_id)
    d.push(user)
    end

    d_array_nums=d.size
    e=[]
    d_array_nums.times do |d_array_num|
      chat_user_names = d[d_array_num].nickname
      e.push(chat_user_names)
    end
    
    @dm_user_names=e

  end

  private
  def chat_params
      params.require(:chat).permit(:message, :room_id)
  end

end
