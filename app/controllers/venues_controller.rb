class VenuesController < ApplicationController
  def index
    @venues = Venue.all

    render("venues/index.html.erb")
  end

  def show
    @venue_date_relation = VenueDateRelation.new
    @venue = Venue.find(params[:id])

    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new

    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.date_id = params[:date_id]
    @venue.venue_title = params[:venue_title]
    @venue.venue_description = params[:venue_description]
    @venue.street_address = params[:street_address]
    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.zip_code = params[:zip_code]
    @venue.website_url = params[:website_url]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/new", "/create_venue"
        redirect_to("/venues")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue created successfully.")
      end
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.date_id = params[:date_id]
    @venue.venue_title = params[:venue_title]
    @venue.venue_description = params[:venue_description]
    @venue.street_address = params[:street_address]
    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.zip_code = params[:zip_code]
    @venue.website_url = params[:website_url]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/#{@venue.id}/edit", "/update_venue"
        redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue updated successfully.")
      end
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue deleted.")
    end
  end
end
