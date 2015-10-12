class ListsController < ApplicationController
  def new
    @list = List.new
    4.times { @list.users.build}
  end

  def create
    @list = List.new(list_params)

    if @list.save
      # Tell the UserMailer to send a welcome email after save
      @list.users.each do |user|
        UserMailer.welcome_email(user).deliver_now
      end
        
      render json: @list, status: :created, location: @list
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
end
