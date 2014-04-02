class FacultiesController < ApplicationController
  respond_to :html, :json

  def index
    @faculty = Faculty.new
    @faculties = Faculty.all
    @faculty_items = Faculty.all
  end

  def create
  	@faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:success] = "Faculty created"
      redirect_to faculties_path
    else
      @faculty_items = []
      render 'index'
    end
  end


  def destroy
    Faculty.find(params[:id]).destroy
    flash[:success] = "Faculty deleted."
    redirect_to faculties_path
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end
  
  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update_attributes(faculty_params)
        flash[:success] = "Faculty updated."
        redirect_to faculties_path
      else
        render 'edit'
    end
  end


  private

    def faculty_params
      params.require(:faculty).permit(:faculty_name,:faculty_short_name, :faculty_type)
    end
end
