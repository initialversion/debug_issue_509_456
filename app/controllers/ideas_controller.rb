class IdeasController < ApplicationController
  def index
    @ideas = Idea.all

    render("ideas/index.html.erb")
  end

  def show
    @idea = Idea.find(params[:id])

    render("ideas/show.html.erb")
  end

  def new
    @idea = Idea.new

    render("ideas/new.html.erb")
  end

  def create
    @idea = Idea.new

    @idea.user_id = params[:user_id]
    @idea.date_title = params[:date_title]
    @idea.date_description = params[:date_description]
    @idea.price_category = params[:price_category]

    save_status = @idea.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ideas/new", "/create_idea"
        redirect_to("/ideas")
      else
        redirect_back(:fallback_location => "/", :notice => "Idea created successfully.")
      end
    else
      render("ideas/new.html.erb")
    end
  end

  def edit
    @idea = Idea.find(params[:id])

    render("ideas/edit.html.erb")
  end

  def update
    @idea = Idea.find(params[:id])

    @idea.user_id = params[:user_id]
    @idea.date_title = params[:date_title]
    @idea.date_description = params[:date_description]
    @idea.price_category = params[:price_category]

    save_status = @idea.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ideas/#{@idea.id}/edit", "/update_idea"
        redirect_to("/ideas/#{@idea.id}", :notice => "Idea updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Idea updated successfully.")
      end
    else
      render("ideas/edit.html.erb")
    end
  end

  def destroy
    @idea = Idea.find(params[:id])

    @idea.destroy

    if URI(request.referer).path == "/ideas/#{@idea.id}"
      redirect_to("/", :notice => "Idea deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Idea deleted.")
    end
  end
end