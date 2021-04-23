class ChatsController < ApplicationController
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
    @rooms = Room.joins(:user_rooms).where("user_rooms.user_id =?",current_user.id)
    user_room=UserRoom.find_by(user_id: params[:user_id])
    chat_user_ids=UserRoom.where(room_id: user_room.room_id).where.not(user_id: params[:user_id])
    chat_user_ids.each do |chat_user_id| 
      @chat_user=User.where(id: chat_user_id.user_id)
    end
  end

  private
  def chat_params
      params.require(:chat).permit(:message, :room_id)
  end

end
