class Api::V1::TasksController < Api::V1::BaseController
	def index
		respond_with Task.all
	end

	def create
		respond_with :api, :v1, Task.create(task_params), json: Task.all
	end
		
	def destroy
		respond_with Task.destroy(params[:id]), json: Task.all
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

	def toggleAll
		tasks = Task.all
		tasks.each do |task|
			task.update_attributes(:isCompleted => params["toggleParam"])
		end
		respond_with tasks, json: tasks
	end

	private def task_params 
		params.require(:task).permit(:id, :name, :isCompleted, :isEditable, :dueDate, :priority)
	end
end
