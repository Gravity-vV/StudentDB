class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]


  def gradeinputshow
    @SC=StudentsCourses.all
  end

  def gradeinput
    # @SC=StudentsCourses.all
    @item=StudentsCourses.new
    @stu=Student.find_by_stuno(params[:stuno])
    c=Course.find_by_cno(params[:cno])
    #find_by只返回找到的第一个值，但是这就够了
    @rs=TeachersCourses.find_by(group_id: @stu.group.id, course_id: c.id)
    #如果没有找到的话就返回，否则保存
    if !@rs
      #说明还没有开设课程,返回到课程开设列表
      redirect_to coursesetshow_teachers_path
    else
      sc=StudentsCourses.find_by(student_id: @stu.id,course_id: c.id)
      # 如果可以找到已有的成绩记录并且小于60分并且没有补考
      if sc && sc.grade<60 && !sc.make_up
        sc.update_attribute(:grade,params[:grade])
        sc.update_attribute(:make_up,true)
      end
      # 说明是第一次成绩录入,插入一条记录
      if !sc
        @item.student_id=@stu.id
        @item.course_id = c.id
        @item.grade=params[:grade]
        @item.make_up=false
        @item.save
      end
      redirect_to gradeinputshow_teachers_path
    end

    # if @item.save
    #    redirect_to gradeinputshow_teachers_path, notice: "Teacher was successfully created."
    # end
    # redirect_to gradeinputshow_teachers_path
  end

  def coursesetshow
    @SC=TeachersCourses.all
  end
  def courseset
    @item=TeachersCourses.new
    t = Teacher.find_by_name(params[:teacher_name])
    @item.teacher_id = t.id
    g = Group.find_by_gno(params[:gno])
    @item.group_id = g.id
    c = Course.find_by_cno(params[:cno])
    @item.course_id = c.id

    @rs=MajorsCourses.find_by(major_id: g.major.id, course_id: c.id)
    # 如果这个班计划里有这门课，那就可以开课
    if @rs
      @item.save
      redirect_to coursesetshow_teachers_path
    else
      # 否则就要去对应的专业先开这门课
      redirect_to addcourse_majors_path(g.major)
    end
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
