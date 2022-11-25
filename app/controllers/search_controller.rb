class SearchController < ApplicationController

  def searchbysno
    @stu = Student.find_by_stuno(params[:stuno])
    resault(@stu)
  end
  def searchbynm
    @stu = Student.find_by_name(params[:name])
    resault(@stu)
  end

  def searchbymno
    # render json:{
    #     status: 'ok'
    # }
    @major = Major.find_by_mno(params[:mno])
    @mgroups=Group.where(major_id: @major.id)#查询出所有的班级
    @stus=Student.where(group_id: @mgroups.ids)
    json=Hash.new
    msg=Hash.new
    if @stus
      json=json.merge(:status => "ok")
      # json=json.merge(:msg => msg)
      @stus.each do |stu|
        j={
            name: stu.name,
            stuno: stu.stuno,
            birth: stu.birth,
            male: stu.male,
            group_id: stu.group_id
        }
        msg=msg.merge(stu.id => j)
      end
      json=json.merge(:msg => msg)
      render json: json
    else
      json=json.merge(:status => "err")
      json=json.merge(:msg => "空")
      render json: json
    end

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
