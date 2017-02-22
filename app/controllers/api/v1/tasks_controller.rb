class Api::V1::TasksController < Api::V1::BaseController
	def index
		respond_with Task.all
	end

	def create
		respond_with :api, :v1, Task.create(task_params)
	end
		
	def destroy
		respond_with Task.destroy(params[:id])
	end

	def update
		task = Task.find(params["id"])
		attributes = task_params.clone
		attributes[:isEditable] = false
		task.update_attributes(attributes)
		respond_with task, json: task
	end 

	def setIsEditable
		task = Task.find(params["id"])
		attributes = task_params.clone
		attributes[:isEditable] = true
		task.update_attributes(attributes)
		respond_with task, json: task
	end

	private def task_params 
		params.require(:task).permit(:id, :name, :isCompleted, :isEditable)
	end
end
