collection_actions = [:index, :new, :create]

# 🚅 Don't remove this block, it will break Super Scaffolding.
begin do
  namespace :customers do
    shallow do
      resources :teams do
      end
    end
  end
end