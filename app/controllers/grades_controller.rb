class GradesController < ApplicationController
  respond_to :html, :xls

  before_action :teacher_logged_in, only: [:update]

  def update
    @grade=Grade.find_by_id(params[:id])
    if @grade.update_attributes!(:grade => params[:grade][:grade])
      flash={:success => "#{@grade.user.name} #{@grade.course.name}的成绩已成功修改为 #{@grade.grade}"}
    else
      flash={:danger => "上传失败.请重试"}
    end
    redirect_to grades_path(course_id: params[:course_id]), flash: flash
  end

  def index  
    @course = Array.new
    if teacher_logged_in?
      if(params[:sp] == nil )
        sp = 1;
      else
        sp = params[:sp].to_i
      end
      
      @course=Course.find_by_id(params[:course_id])
      @grades=@course.grades
  
      if(sp == 2)
        @grades_fail=Array.new
        @grades.each do |grade|
          if grade.grade&&grade.grade<60
            @grades_fail<<grade
          end
        end

        @grades=@grades_fail
      elsif(sp == 3)
                @grades_fail=Array.new
        @grades.each do |grade|
          if grade.grade&&grade.grade>=60
            @grades_fail<<grade
          end
        end
        @grades=@grades_fail
      end
    elsif student_logged_in?
      @grades=current_user.grades
    else
      redirect_to root_path, flash: {:warning=>"请先登陆"}
    end
  end
  
  def excel 
    if teacher_logged_in?
      @course=Course.find_by_id(params[:course_id])
      @grades=@course.grades
      respond_with @grades
    elsif student_logged_in?
      @grades=current_user.grades
      respond_with @grades
    else
      redirect_to root_path, flash: {:warning=>"请先登陆"}
    end
    
    
  end 

  private
  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

end
