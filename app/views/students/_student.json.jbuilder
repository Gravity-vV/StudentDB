json.extract! student, :id, :name, :stuno,:birth,:male,:group_id, :created_at, :updated_at
json.url student_url(student, format: :json)
