Tasklisthaml::Application.routes.draw do

  devise_for :users

  resources :buckets, :shallow=>true do
    resources :tasks do 
      member do
        post 'complete'=>"tasks#complete"
        # /tasks/:id/complete
      end
      collection do
        get 'completed'=>'tasks#completed'
        # /buckets/:id/tasks/completed
      end
    end
  end

  root :to=>"welcome#index"
end
