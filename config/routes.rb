Rails.application.routes.draw do

	devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }

	root 'home#index'

	get 'dashboard' => 'home#dashboard', as: 'dashboard'
	get 'admin' => 'admin#index', as: 'admin'

	get 'apply_for_teacher' => 'teachers#apply', as: 'apply_for_teacher'
	get 'certify_teacher/:id' => 'teachers#certify', as: 'teacher_certify'

end
