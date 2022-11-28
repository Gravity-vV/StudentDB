# 西电数据库大作业

本项目是作者的数据库大作业，基于rails开发的BS架构的学生学籍管理系统。
非常捡漏，只是为了完成任务，不过后续有机会会进行更多细节的添加。

其中实现了:

- 录入一位学生，应包含学号、姓名、性别、出生年月、班级等信息
  
- 按学号、姓名、专业三种方式查询学生基本信息

- 录入一位学生一门课的成绩

- 查询一位学生所修的课程、性质（必修或选修）、学期、学分及成绩；查询他的必修课平均成绩、所有课程平均成绩（平均成绩应按学分加权）

- 查询一位学生被哪些教师教过课

- 查询快要被开除的学生（距被开除差3学分之内）


具体版本参数以及使用说明如下：

* Ruby version
 
    ruby 2.6.6p146 (2020-03-31 revision 67876) [x64-mingw32]
    
    rails 6.1.7

* System dependencies

      postgressql

* Configuration

    /config/database.yml 中需要保证本地的postgres和配置文件中的
    账号密码一致（均为postgres）

* Database creation

    在执行数据库创建之前要首先完成gem包的下载，在终端输入
    
        bundle install

    在终端执行下列语句创建数据库
        
        rails db:create
        
* Database initialization

    接着，你需要执行
    
        rails db:migrate
    
    执行表的迁移

* How to run the project

    在终端输入(端口可选，默认为3000)
        
        rails s (-p xxxx)
    
    打开浏览器在地址中输入后台显示的地址即可运行本项目