class TasksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:toggle]    

    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to project_path(@project.id)
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to project_path(params[:project_id])
    end

    def toggle
        head :ok
        @task = Task.find(params[:id])
        @task.done = !@task.done
        @task.save
    end

    private
        def task_params
            params[:task].permit(:title, :image)   
        end
end
