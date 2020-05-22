class UserClipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_clip, only: [:show, :edit, :update, :destroy]

  def index
    @user_clips = current_user.user_clips.order(created_at: :desc)
  end

  def show
    @clip = @user_clip.clip
  end

  def new
    @user_clip = UserClip.new
  end

  def edit
  end

  def create
    @clip = Clip.find_or_initialize_by(url: params[:url])
    @user_clip = current_user.user_clips.build(clip: @clip)

    respond_to do |format|
      if @clip.save && @user_clip.save
        format.html { redirect_to user_clips_url, notice: 'User clip was successfully created.' }
        format.json { render :show, status: :created, location: @user_clip }
      else
        format.html { render :new }
        format.json { render json: @user_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_clip.update(user_clip_params)
        format.html { redirect_to @user_clip, notice: 'User clip was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_clip }
      else
        format.html { render :edit }
        format.json { render json: @user_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_clip.destroy
    respond_to do |format|
      format.html { redirect_to user_clips_url, notice: 'User clip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_clip
      @user_clip = UserClip.find(params[:id])
    end

    def user_clip_params
      params.require(:user_clip).permit(:user_id, :clip_id)
    end
end
