Rails.application.routes.draw do
	root to: 'site#index'
	
	namespace :api do
		namespace :v1 do
			resources :tasks, only: [:index, :create, :destroy, :update]
			match '/tasks/:id/setIsEditable' => 'tasks#setIsEditable', :via => [:put], :as => :task_is_editable_set
			match '/tasks/toggleAll/:toggleParam' => 'tasks#toggleAll', :via => [:put], :as => :task_toggle_all
		end
	end
end
