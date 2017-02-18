json.extract! task, :id, :name, :isCompleted, :isEditable, :created_at, :updated_at
json.url task_url(task, format: :json)