class DataTypesController < ApplicationController
  def index
    @data_types = DataType.all

    render("data_types/index.html.erb")
  end

  def show
    @data_type = DataType.find(params[:id])

    render("data_types/show.html.erb")
  end

  def new
    @data_type = DataType.new

    render("data_types/new.html.erb")
  end

  def create
    @data_type = DataType.new

    @data_type.name = params[:name]
    @data_type.data_type = params[:data_type]
    @data_type.description = params[:description]

    save_status = @data_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/data_types/new", "/create_data_type"
        redirect_to("/data_types")
      else
        redirect_back(:fallback_location => "/", :notice => "Data type created successfully.")
      end
    else
      render("data_types/new.html.erb")
    end
  end

  def edit
    @data_type = DataType.find(params[:id])

    render("data_types/edit.html.erb")
  end

  def update
    @data_type = DataType.find(params[:id])

    @data_type.name = params[:name]
    @data_type.data_type = params[:data_type]
    @data_type.description = params[:description]

    save_status = @data_type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/data_types/#{@data_type.id}/edit", "/update_data_type"
        redirect_to("/data_types/#{@data_type.id}", :notice => "Data type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Data type updated successfully.")
      end
    else
      render("data_types/edit.html.erb")
    end
  end

  def destroy
    @data_type = DataType.find(params[:id])

    @data_type.destroy

    if URI(request.referer).path == "/data_types/#{@data_type.id}"
      redirect_to("/", :notice => "Data type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Data type deleted.")
    end
  end
end
