class StudentsController < ApplicationController

  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    #不如让我们在这里把他查出来得了
    # 查询一位学生所修的课程、性质（必修或选修）、学期、学分及成绩；---查询他的必修课平均成绩、所有课程平均成绩（平均成绩应按学分加权）
    #这是当前页面的学生
    # 操你妈的傻逼rails
    @items=StudentsCourses.where(:student_id == @student.id)
    @courses=@student.courses
    @comans=0
    @allans=0
    sumcrecom=0
    sumcre=0
    @items.each do |item|
      cour=Course.find item.course_id
      if cour.compulsory
        @comans=@comans+cour.credit*item.grade
        sumcrecom=sumcrecom+cour.credit
      end
      @allans=@allans+cour.credit*item.grade
      sumcre=sumcre+cour.credit
      #对于每一个item都有一个course_id,根据这个寻找带了这个课的老师即可

    end
    @comans=@comans/sumcrecom
    @allans=@allans/sumcre

    #被哪些教师带过


    #先链接，再多条件查询，再使用集函数,除法运算只要有一个是浮点数那么结果就是一个浮点数
    # @conans=Course.joins("INNER JOIN students_courses ON students_courses.course_id=courses.id").
    # sumconcredit=StudentsCourses.joins("INNER JOIN courses ON course_id=courses.id").
    #     where("student_id = ? AND compulsory = ?",@student.id,true).sum(:credit)
    # @conans=sumcon/sumconcredit
    # sumall=StudentsCourses.where(:student_id ==@student.id).average(:grade)
    # sumallcredit=StudentsCourses.joins("INNER JOIN courses ON course_id=courses.id").
    #     where("student_id = ?",@student.id).sum(:credit)
    # @allans=sumall/sumallcredit
    # StudentsCourses.where(:student_id==2 AND Courses.conpulsory==true)
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :stuno, :birth, :male,:group_id )
    end
end
