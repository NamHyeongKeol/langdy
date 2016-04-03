Rails.application.routes.draw do

	devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

	root 'home#index'

	get 'dashboard' => 'home#dashboard', as: 'dashboard'
	get 'admin' => 'admin#index', as: 'admin'
	get 'admin/teacher' => 'admin#teacher', as: 'admin_teacher'
	get 'admin/cash' => 'admin#cash', as: 'admin_cash'
	get 'admin/feedback' => 'admin#feedback', as: 'admin_feedback'

	get 'apply_for_teacher' => 'teachers#apply', as: 'apply_for_teacher'
	post 'teachers/apply' => 'teachers#submit_teacher_application', as: 'submit_teacher_application'
	get 'certify_teacher/:id' => 'teachers#certify', as: 'teacher_certify'
  get 'edit_teacher_info' => 'teachers#edit_teacher_info', as: 'edit_teacher_info'
  post 'teacher/update_info' => 'teachers#update_teacher_info', as: 'update_teacher_info'

	get 'find_teacher' => 'teachers#index', as: 'find_teacher'
	post 'teachers/filter_teachers'

	get 'teacher/:id' => 'teachers#show', as: 'teacher'
	post 'teacher/add_comment/:id' => 'teachers#add_comment', as: 'teacher_comments'
	delete 'teacher/destroy_comment/:id' => 'teachers#destroy_comment', as: 'destroy_teacher_comment'

	get 'purchase' => 'cash#index', as: 'purchase'
	post 'submit_purchase' => 'cash#submit_purchase', as: 'submit_purchase'
	get 'permit_purchase/:id' => 'cash#permit_purchase', as: 'permit_purchase'

	post 'feedback' => 'home#feedback', as: 'feedback'

	get 'book_lesson/:id' => 'lesson#select_time', as: 'select_time'
	post 'book_lesson' => 'lesson#book', as: 'book_path'
end
