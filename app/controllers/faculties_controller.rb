class FacultiesController < ApplicationController
  respond_to :html, :json


  def new
    @faculty = Faculty.new
    @faculties = Faculty.all
  end

  def create
  	@faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:success] = "Faculty created"
      redirect_to allfaculties_path
    else
      flash[:errors] =  "Errors DEBUG IT"
      redirect_to allfaculties_path
    end
  end

  def destroy
    Faculty.find(params[:id]).destroy
    flash[:success] = "Faculty deleted."
    redirect_to allfaculties_path
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end
  
  def update
    @faculty = Faculty.find(params[:id])
    respond_to do |format|
      if @faculty.update_attributes(faculty_params)
        format.html {redirect_to faculties notice: "updated"}
        format.xml  { head :ok }
        format.json { respond_with_bip(@faculty) }
      else
        format.html {render :action => 'edit'}
        format.json {render :jason => @faculty.errors.fullmessages}
      end
    end
  end


  private

    def faculty_params
      params.require(:faculty).permit(:faculty_name,:faculty_short_name, :faculty_type)
    end
end
