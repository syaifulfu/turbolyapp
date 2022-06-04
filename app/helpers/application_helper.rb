module ApplicationHelper

    def todays
        @todays = Task.where(created_by: current_user.id, due_date: Date.today).order(priority: :desc, created_at: :asc)
    end

    def login_check
        if current_user == nil
            redirect_to login_path
        end
    end

    def logged_in_check
        if current_user
            redirect_to root_path
        end
    end
    

end
