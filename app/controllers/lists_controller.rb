class ListsController < ApplicationController
  def new
    @list = List.new
    5.times { @list.users.build }
  end

  def create
    @list = List.new(list_params)

    if @list.save
      # Tell the UserMailer to send a welcome email after save
      send_emails
        
      render :show
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

    private

    def list_params
      params.require(:list).permit(:user, :price_limit, users_attributes: [:id, :name, :email])
    end

    def send_emails
    @users = @list.users.shuffle
    for i in -1..(@users.size - 2)
        UserMailer.welcome_email(@users[i], @users[i+1]).deliver_now
      end
  end
end
