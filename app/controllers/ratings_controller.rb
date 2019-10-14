
class RatingsController < ApplicationController
  def index 
    if current_user != nil && current_user.role == "customer"
    ratings = current_user.ratings
    render json: ratings.to_json( 
    include: [:favorites, :ratings, :reviews]) 
  else
    ratings = Rating.all
    render json: ratings
  end
  end
  def show
    rating = Rating.find_by(id: params[:id])
    render json: rating
  end

  def new
    rating = Rating.find_by(id: params[:id])
  end

  def create
    rating = Rating.create!(rating_params)
    render json: rating
  end
  
  def update
    @rating = Rating.update(rating_params)
    @rating.save
  end
  def destory
    Rating.find_by(id: params[:id]).delete
  end


  private 
  def rating_params
    params.require(:rating).permit(:rater_id, :rated_id, :score)
  end
end