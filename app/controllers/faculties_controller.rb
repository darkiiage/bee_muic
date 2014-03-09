class FacultiesController < ApplicationController
  def new
  	@faculty = Faculty.new
  	@faculties = Faculty.all
  end

  def create
  	@faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:success] = "Faculty created"
      redirect_to mufaculties_path
    else
      render 'new'
    end
  end

  def destroy
    Faculty.find(params[:id]).destroy
    flash[:success] = "Faculty deleted."
    redirect_to mufaculties_path
  end


  private

    def faculty_params
      params.require(:faculty).permit(:faculty_name,:faculty_short_name, :faculty_type)
    end
end
