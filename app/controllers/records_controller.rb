class RecordsController < ApplicationController
  def index
    @q = Record.ransack(params[:q])
    @records = @q.result(:distinct => true).includes(:patient, :datatype).page(params[:page]).per(10)

    render("records/index.html.erb")
  end

  def show
    @record = Record.find(params[:id])

    render("records/show.html.erb")
  end

  def new
    @record = Record.new

    render("records/new.html.erb")
  end

  def create
    @record = Record.new

    @record.patient_id = params[:patient_id]
    @record.prescription_id = params[:prescription_id]
    @record.date_time = params[:date_time]
    @record.data = params[:data]
    @record.datatype_id = params[:datatype_id]

    save_status = @record.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/records/new", "/create_record"
        redirect_to("/records")
      else
        redirect_back(:fallback_location => "/", :notice => "Record created successfully.")
      end
    else
      render("records/new.html.erb")
    end
  end

  def edit
    @record = Record.find(params[:id])

    render("records/edit.html.erb")
  end

  def update
    @record = Record.find(params[:id])

    @record.patient_id = params[:patient_id]
    @record.prescription_id = params[:prescription_id]
    @record.date_time = params[:date_time]
    @record.data = params[:data]
    @record.datatype_id = params[:datatype_id]

    save_status = @record.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/records/#{@record.id}/edit", "/update_record"
        redirect_to("/records/#{@record.id}", :notice => "Record updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Record updated successfully.")
      end
    else
      render("records/edit.html.erb")
    end
  end

  def destroy
    @record = Record.find(params[:id])

    @record.destroy

    if URI(request.referer).path == "/records/#{@record.id}"
      redirect_to("/", :notice => "Record deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Record deleted.")
    end
  end
end
