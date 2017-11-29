class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all

    render("prescriptions/index.html.erb")
  end

  def show
    @prescription = Prescription.find(params[:id])

    render("prescriptions/show.html.erb")
  end

  def new
    @prescription = Prescription.new

    render("prescriptions/new.html.erb")
  end

  def create
    @prescription = Prescription.new

    @prescription.doctor_id = params[:doctor_id]
    @prescription.patient_id = params[:patient_id]
    @prescription.data_type_id = params[:data_type_id]

    save_status = @prescription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prescriptions/new", "/create_prescription"
        redirect_to("/prescriptions")
      else
        redirect_back(:fallback_location => "/", :notice => "Prescription created successfully.")
      end
    else
      render("prescriptions/new.html.erb")
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])

    render("prescriptions/edit.html.erb")
  end

  def update
    @prescription = Prescription.find(params[:id])

    @prescription.doctor_id = params[:doctor_id]
    @prescription.patient_id = params[:patient_id]
    @prescription.data_type_id = params[:data_type_id]

    save_status = @prescription.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/prescriptions/#{@prescription.id}/edit", "/update_prescription"
        redirect_to("/prescriptions/#{@prescription.id}", :notice => "Prescription updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Prescription updated successfully.")
      end
    else
      render("prescriptions/edit.html.erb")
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])

    @prescription.destroy

    if URI(request.referer).path == "/prescriptions/#{@prescription.id}"
      redirect_to("/", :notice => "Prescription deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Prescription deleted.")
    end
  end
end