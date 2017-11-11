class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :user_authentification
    
    def show
    end
    
    private
    
    helper_method :current_lesson
    def current_lesson
        @current_lesson ||= Lesson.find(params[:id])
    end
    
    def user_authentification
        if ! current_user.enrolled_in?(current_lesson.section.course)
            redirect_to course_path(current_lesson.section.course), alert: 'Please enroll in order to view course material'
        end
    end
    
        
end
