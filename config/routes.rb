class ActionDispatch::Routing::Mapper
  def subapp_draw(subapp)
    subspace subapp do
      instance_eval(File.read(Rails.root.join("config/routes-#{subapp}.rb")))
    end
  end

  def subspace(domain)
    #constraints(subdomain: domain.to_s) do
    constraints(host: /#{domain}\./) do
      yield
    end
  end
end
      
Rails.application.routes.draw do

  subapp_draw :api

  resource  :session
  resources :examples

  resources :messages do
    resources :comments
  end

  root 'messages#index'
end
