class MajorsController < ApplicationController
  before_action :set_major, only: %i[ show edit update destroy addcourse ]


  # addcourse_majors_path
  def showcoursesofmajor
    @major=Major.find(params[:id])
    @courses=@major.courses
    if @courses
      respond_to do |format|
        format.js { render partial: 'majors/result' }
      end
    end
    # @MC=MajorsCourses.find_by_major_id(@major.id)
  end
  def addcourse
    @major=Major.find(params[:id])
  end

  # addcoursepost_majors
  def addcoursepost
    @item=MajorsCourses.new
    @item.major_id = params[:id]
    @major = Major.find(params[:id])
    # @major=Major.find(params[:id])
    course = Course.find_by_cno(params[:cno])
    @item.course_id = course.id
    @item.compulsory = params[:compulsory]
    @item.credit = params[:credit]
    @item.start_time = params[:start_time]
    if @item.save
      redirect_to  major_path(@major)
    else
      redirect_to addcourse_majors_path
    end
  end

  # GET /majors or /majors.json
  def index
    @majors = Major.all
  end

  # GET /majors/1 or /majors/1.json
  def show
  end

  # GET /majors/new
  def new
    @major = Major.new
  end

  # GET /majors/1/edit
  def edit
  end

  # POST /majors or /majors.json
  def create
    @major = Major.new(major_params)

    respond_to do |format|
      if @major.save
        format.html { redirect_to major_url(@major), notice: "Major was successfully created." }
        format.json { render :show, status: :created, location: @major }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /majors/1 or /majors/1.json
  def update
    respond_to do |format|
      if @major.update(major_params)
        format.html { redirect_to major_url(@major), notice: "Major was successfully updated." }
        format.json { render :show, status: :ok, location: @major }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /majors/1 or /majors/1.json
  def destroy
    @major.destroy

    respond_to do |format|
      format.html { redirect_to majors_url, notice: "Major was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_major
      @major = Major.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def major_params
      params.require(:major).permit(:name, :mno)
    end
end
