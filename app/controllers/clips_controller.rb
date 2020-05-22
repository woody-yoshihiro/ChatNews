class ClipsController < ApplicationController
  before_action :set_clip, only: [:show, :edit, :update, :destroy]

  def index
    @clips = Clip.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @clip = Clip.new
  end

  def edit
  end

  def create
    @clip = Clip.new(clip_params)

    respond_to do |format|
      if @clip.save
        format.html { redirect_to @clip, notice: "新しいクリップを作成しました。" }
        format.json { render :show, status: :created, location: @clip }
      else
        format.html { render :new }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @clip, notice: "クリップを更新しました。" }
        format.json { render :show, status: :ok, location: @clip }
      else
        format.html { render :edit }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clip.destroy
    respond_to do |format|
      format.html { redirect_to clips_url, notice: "クリップを削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    def set_clip
      @clip = Clip.find(params[:id])
    end

    def clip_params
      params.require(:clip).permit(:url, :title, :description, :image)
    end
end
