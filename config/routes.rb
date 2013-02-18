Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :solution_boxes do
    resources :solution_boxes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :solution_boxes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :solution_boxes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
