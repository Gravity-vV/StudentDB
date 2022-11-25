class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]


  def gradeinputshow
    @SC=StudentsCourses.all

  end

  def gradeinput
    # @SC=StudentsCourses.all
    @item=StudentsCourses.new
    @item.student_id=params[:student_id]
    @item.course_id=params[:course_id]
    @item.grade=params[:grade]
    @item.save
    redirect_to gradeinputshow_teachers_path
    # if @item.save
    #    redirect_to gradeinputshow_teachers_path, notice: "Teacher was successfully created."
    # end
    # redirect_to gradeinputshow_teachers_path
  end
  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers or /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.require(:teacher).permit(:name, :tno,:major_id)
    end

    # def item_params
    #   params.require(:item).permit(:student_id, :course_id,:grade)
    # end

end
