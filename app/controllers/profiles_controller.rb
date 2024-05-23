class ProfilesController < ApplicationController

  def show; end

  def edit; end

  def update
    @profile.avatar.attach(params[:profile][:avatar]) if @profile.avatar.blank?
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'プロフィールを更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :gender, :body, :avatar )
  end

end
