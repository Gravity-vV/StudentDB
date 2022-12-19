require 'set'
class StudentsController < ApplicationController

  before_action :set_student, only: %i[ show edit update destroy ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  def getstuwei
    # json=Hash.new
    # msg=Hash.new
    @stus=Set[]
    # @stus=Hash.new
    students = Student.all
    students.each do |stu|
      items=StudentsCourses.where(student_id: stu.id)
      comans=0
      sumcrecom=0
      items.each do |item|
        cour=Course.find item.course_id
        if cour.compulsory
          comans=comans+cour.credit*item.grade
          sumcrecom=sumcrecom+cour.credit
          end

      end
      comans=comans/sumcrecom
      if comans-3<=60
        # j={
        #     name: stu.name,
        #     stuno: stu.stuno,
        #     birth: stu.birth,
        #     male: stu.male,
        #     group_id: stu.group_id
        # }
        # msg=msg.merge(stu.id => j)
        @stus << stu
        # @stus=@stus.merge(stu.id => stu)

      end
      if !@stus.empty?
        respond_to do |format|
          format.html { render partial: 'students/result' }
        end
      end
    end

  #   json=json.merge(:msg => msg)
  #   if msg.empty?
  #     json=json.merge(:status => 'empty')
  #     render json: json
  #   else
  #     json=json.merge(:status => 'err')
  #     render json: json
  #   end
  end

  # GET /students/1 or /students/1.json
  def show
    #不如让我们在这里把他查出来得了
    # 查询一位学生所修的课程、性质（必修或选修）、学期、学分及成绩；---查询他的必修课平均成绩、所有课程平均成绩（平均成绩应按学分加权）
    #这是当前页面的学生
    # 操你妈的傻逼rails
    @items=StudentsCourses.where(student_id: @student.id)
    @courses=@student.courses
    @major=@student.group.major
    @comans=0
    @allans=0
    sumcrecom=0
    sumcre=0
    # 关于当前学生的所有成绩记录
    @items.each do |item|
      # notice: the result of 'where' is a set
      mc = MajorsCourses.where('major_id = ? AND course_id = ? ',@major.id,item.course_id ).first
      # cour=Course.find item.course_id
      if mc.compulsory
        @comans=@comans+mc.credit*item.grade
        sumcrecom=sumcrecom+mc.credit
      end
      @allans=@allans+mc.credit*item.grade
      sumcre=sumcre+mc.credit
      #对于每一个item都有一个course_id,根据这个寻找带了这个课的老师即可

    end
    if sumcrecom!=0
      @comans=@comans/sumcrecom
    end
    if sumcre!=0
      @allans=@allans/sumcre
    end

    #被哪些教师带过(不能重复)
    @result = Set[]
    @TC=TeachersCourses.where(group_id: @student.group_id)
    @TC.each do |t|
      @result << t.teacher_id
    end

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
