Spree::Core::Engine.add_routes do
  # Add your extension routes here
  post '/webpay/webpay_final_url', :to => 'webpay#webpay_final_url', :as => :webpay_result
  post '/webpay/webpay_return_url', :to => 'webpay#webpay_return_url', :as => :webpay_return_url
  get 'webpay/success', :to => 'webpay#webpay_success', :as => :webpay_success
  get 'webpay/error', :to => 'webpay#webpay_error', :as => :webpay_error
  get 'webpay/nullify', :to => 'webpay#webpay_nullify', :as => :webpay_nullify
end
