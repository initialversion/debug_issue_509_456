class VenueDateRelationsController < ApplicationController
  def index
    @q = VenueDateRelation.ransack(params[:q])
    @venue_date_relations = @q.result(:distinct => true).includes(:date, :venue).page(params[:page]).per(10)

    render("venue_date_relations/index.html.erb")
  end

  def show
    @venue_date_relation = VenueDateRelation.find(params[:id])

    render("venue_date_relations/show.html.erb")
  end

  def new
    @venue_date_relation = VenueDateRelation.new

    render("venue_date_relations/new.html.erb")
  end

  def create
    @venue_date_relation = VenueDateRelation.new

    @venue_date_relation.date_id = params[:date_id]
    @venue_date_relation.venue_id = params[:venue_id]
    @venue_date_relation.information = params[:information]

    save_status = @venue_date_relation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venue_date_relations/new", "/create_venue_date_relation"
        redirect_to("/venue_date_relations")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue date relation created successfully.")
      end
    else
      render("venue_date_relations/new.html.erb")
    end
  end

  def edit
    @venue_date_relation = VenueDateRelation.find(params[:id])

    render("venue_date_relations/edit.html.erb")
  end

  def update
    @venue_date_relation = VenueDateRelation.find(params[:id])

    @venue_date_relation.date_id = params[:date_id]
    @venue_date_relation.venue_id = params[:venue_id]
    @venue_date_relation.information = params[:information]

    save_status = @venue_date_relation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venue_date_relations/#{@venue_date_relation.id}/edit", "/update_venue_date_relation"
        redirect_to("/venue_date_relations/#{@venue_date_relation.id}", :notice => "Venue date relation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue date relation updated successfully.")
      end
    else
      render("venue_date_relations/edit.html.erb")
    end
  end

  def destroy
    @venue_date_relation = VenueDateRelation.find(params[:id])

    @venue_date_relation.destroy

    if URI(request.referer).path == "/venue_date_relations/#{@venue_date_relation.id}"
      redirect_to("/", :notice => "Venue date relation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue date relation deleted.")
    end
  end
end
