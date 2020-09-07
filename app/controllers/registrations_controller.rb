class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end

  def confirm
    @registration = Registration.new(registration_params)
    unless @registration.valid?
      flash.now[:danger] = "正しく入力してください。"
      render :new
    end
  end

  def create
    @registration = Registration.new(registration_params)

    if params[:back].present?
      render :new
      return
    end

    if @registration.save
      redirect_to action: :finish
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end

  def finish
  end

  private
  def registration_params
    params.require(:registration).permit(:name)
  end
end
