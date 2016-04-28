Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

	root 'home#index', as: 'home'

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
	get 'teachers/filter_teachers', as: 'filter_teacher'

	get 'teacher/:id' => 'teachers#show', as: 'teacher'
	post 'teacher/add_comment/:id' => 'teachers#add_comment', as: 'teacher_comments'
	delete 'teacher/destroy_comment/:id' => 'teachers#destroy_comment', as: 'destroy_teacher_comment'

	get 'purchase' => 'cash#index', as: 'purchase'
  get 'purchase/buycoin' => 'cash#buycoin', as: 'buycoin'
  get 'purchase/sellcoin' => 'cash#sellcoin', as: 'sellcoin'
  get 'purchase/history' => 'cash#coinhistory', as: 'coinhistory'

	post 'submit_purchase' => 'cash#submit_purchase', as: 'submit_purchase'
	get 'permit_purchase/:id' => 'cash#permit_purchase', as: 'permit_purchase'

	post 'feedback' => 'home#feedback', as: 'feedback'

	get 'book_lesson/:id' => 'lesson#select_time', as: 'select_time'
	post 'book_lesson' => 'lesson#book', as: 'book_path'

	# Lesson
	post 'get_lessons' => 'lesson#getLessons', as: 'get_lessons'
	post 'submit_lesson' => 'lesson#submitLesson', as: 'submit_lesson'

	# Course
	post 'get_courses' => 'course#getCourses', as: 'get_courses'

  # Lecture Room
  get 'lecture_room' => 'lecture_room#index', as: 'lecture_room'
  get 'self_study' => 'lecture_room#self_study', as: 'self_study'
  get 'take_lesson' => 'lecture_room#take_lesson', as: 'take_lesson'
  get 'give_lesson' => 'lecture_room#give_lesson', as: 'give_lesson'
  get 'lecture_room/get_lesson' => 'lecture_room#get_lesson'
  get 'lecture_room/save_memo' => 'lecture_room#save_memo'
  get 'get_selected_lesson/:id' => 'lecture_room#get_selected_lesson'
  get 'eval_lesson/:id' => 'lecture_room#eval_lesson'

  post 'confirm_lesson' => 'home#confirm_lesson'
  get 'home/lecture_request_complete'
  get 'home/freematching_request_complete'
end
