Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Cfa::Styleguide::Engine => "/cfa"

  root "static_pages#index"

  resources :screens, controller: :forms, only: %i[show index] do
    collection do
      FormNavigation.form_controllers.uniq.each do |controller_class|
        { get: :edit, put: :update }.each do |method, action|
          match "/#{controller_class.to_param}",
                action: action,
                controller: controller_class.controller_path,
                via: method
        end
      end
    end
  end
end
