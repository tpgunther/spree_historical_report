Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :reports, :only => [:index, :show] do
      collection do
        get :historical_report
        post :historical_report
      end
    end
  end
end
