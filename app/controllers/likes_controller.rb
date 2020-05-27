class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @opinion = Opinion.find(params[:opinion_id])
    @like = @opinion.likes.build(user: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to opinion_path(@like.opinion), notice: "いいねしました" }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to opinion_path(@like.opinion), notice: "いいねを取り消しました" }
      format.json { head :no_content }
    end
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params.require(:like).permit(:opinion_id, :user_id)
    end
end
