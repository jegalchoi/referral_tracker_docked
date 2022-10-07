Rails.application.routes.draw do
  scope :api do
    resources :referrals
  end
end
