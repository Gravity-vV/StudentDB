require 'set'
class SearchController < ApplicationController

  def searchbysno
    stu = Student.find_by_stuno(params[:stuno])
    @stus=Set[]

    if stu
      @stus << stu
      respond_to do |format|
        format.js { render partial: 'students/result' }
      end
    else
      respond_to do |format|
        format.js { render partial: 'students/empty' }
      end
    end
    # resault(@stu)
  end
  def searchbynm
    stu = Student.find_by_name(params[:name])
    @stus=Set[]
    # @stus << stu

    if stu
      @stus << stu
      respond_to do |format|
        format.js { render partial: 'students/result' }
      end
    else
      respond_to do |format|
        format.js { render partial: 'students/empty' }
      end
    end
    # resault(@stu)
  end

  def searchbymno
    # render json:{
    #     status: 'ok'
    # }
    @major = Major.find_by_mno(params[:mno])
    if !@major
      respond_to do |format|
        format.js { render partial: 'students/empty' }
      end
      return
    end
    @mgroups=Group.where(major_id: @major.id)#查询出所有的班级
    if @mgroups.empty?
      respond_to do |format|
        format.js { render partial: 'students/empty' }
      end
      return
    end
    @stus=Student.where(group_id: @mgroups.ids)

    if !@stus.empty?
      respond_to do |format|
        format.js { render partial: 'students/result' }
      end
    else
      # @stus=Set[]
      respond_to do |format|
        format.js { render partial: 'students/empty' }
      end
    end
    # json=Hash.new
    # msg=Hash.new
    # if @stus
    #   json=json.merge(:status => "ok")
    #   # json=json.merge(:msg => msg)
    #   @stus.each do |stu|
    #     j={
    #         name: stu.name,
    #         stuno: stu.stuno,
    #         birth: stu.birth,
    #         male: stu.male,
    #         group_id: stu.group_id
    #     }
    #     msg=msg.merge(stu.id => j)
    #   end
    #   json=json.merge(:msg => msg)
    #   render json: json
    # else
    #   json=json.merge(:status => "err")
    #   json=json.merge(:msg => "空")
    #   render json: json
    # end

  end

  private

  def resault(stu)
    if stu
      render json: {
          status: 'ok',
          msg: {
              name: stu.name,
              stuno: stu.stuno,
              birth: stu.birth,
              male: stu.male,
              group_id: stu.group_id
          }
      }

    else
      render json: {
          status: 'err',
          msg: '查无此人'
      }
    end
  end

end
