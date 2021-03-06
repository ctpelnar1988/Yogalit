class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:godaddy]

  def godaddy
  end

  def index
    if current_user[:teacher_or_student] == "teacher"
      teacher = Teacher.where(user_id: current_user).first
      if teacher.nil?
        path = new_teacher_path
      else
        interview = InterviewBookedTime.where(teacher_id: teacher[:id]).first
        if interview.nil?
          return google_authorize_teacher
        else
          path = teachers_path
        end
      end
    elsif current_user[:teacher_or_student] == "student"
      student = Student.where(user_id: current_user).first
      if student.nil?
        path = new_student_path
      else
        path = students_path
      end
    elsif current_user[:teacher_or_student] == "admin"
      path = yogalit_admins_path
    end

    return redirect_to path
  end

end
