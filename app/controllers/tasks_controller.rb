class TasksController < ApplicationController

    include ApplicationHelper

    def index
        login_check
        @tasks = current_user ? Task.where(created_by: current_user.id).all : Task.all
    end
    
    def show
        login_check
        @task = Task.find(params[:id])
    end

    def new
        login_check
        @task = Task.new
    end
    
    def create
        login_check
        @task = Task.new(task_params)

        if @task.save
            flash[:success] = 'Successfuly create data'
            redirect_to '/tasks'
        else
            # flash[:error] = "Error create data"
            render '/tasks/new', status: :unprocessable_entity
        end
    end

    def edit
        login_check
        @task = Task.find(params[:id])
    end
    
    def update
        login_check
        @task = Task.find(params[:id])

        if @task.update(task_params)
            flash[:success] = "Successfuly update data"
            redirect_to '/tasks'
        else
            flash[:error] = 'Error update data'
            render '/tasks/edit', status: :unprocessable_entity
        end
    end
    

    def destroy
        login_check
        @task = Task.find(params[:id])
        
        if @task.destroy
            flash[:success] = 'Successfuly delete data'
        else
            flash[:error] = 'Error delete data'
        end

        redirect_to '/tasks'
    end

    private

    def task_params
        {
            "name" => params[:task][:name],
            "description" => params[:task][:description],
            "due_date" => params[:task][:due_date],
            "priority" => params[:task][:priority].to_i,
            "created_by" => current_user.id
        }
    end

end