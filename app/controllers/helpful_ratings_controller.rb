class HelpfulRatingsController < ApplicationController
  def index
    @helpful_ratings = HelpfulRating.all

    render("helpful_ratings/index.html.erb")
  end

  def show
    @helpful_rating = HelpfulRating.find(params[:id])

    render("helpful_ratings/show.html.erb")
  end

  def new
    @helpful_rating = HelpfulRating.new

    render("helpful_ratings/new.html.erb")
  end

  def create
    @helpful_rating = HelpfulRating.new

    @helpful_rating.review_id = params[:review_id]
    @helpful_rating.helpful_rate = params[:helpful_rate]
    @helpful_rating.user_id = params[:user_id]

    save_status = @helpful_rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/helpful_ratings/new", "/create_helpful_rating"
        redirect_to("/helpful_ratings")
      else
        redirect_back(:fallback_location => "/", :notice => "Helpful rating created successfully.")
      end
    else
      render("helpful_ratings/new.html.erb")
    end
  end

  def edit
    @helpful_rating = HelpfulRating.find(params[:id])

    render("helpful_ratings/edit.html.erb")
  end

  def update
    @helpful_rating = HelpfulRating.find(params[:id])

    @helpful_rating.review_id = params[:review_id]
    @helpful_rating.helpful_rate = params[:helpful_rate]
    @helpful_rating.user_id = params[:user_id]

    save_status = @helpful_rating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/helpful_ratings/#{@helpful_rating.id}/edit", "/update_helpful_rating"
        redirect_to("/helpful_ratings/#{@helpful_rating.id}", :notice => "Helpful rating updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Helpful rating updated successfully.")
      end
    else
      render("helpful_ratings/edit.html.erb")
    end
  end

  def destroy
    @helpful_rating = HelpfulRating.find(params[:id])

    @helpful_rating.destroy

    if URI(request.referer).path == "/helpful_ratings/#{@helpful_rating.id}"
      redirect_to("/", :notice => "Helpful rating deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Helpful rating deleted.")
    end
  end
end
