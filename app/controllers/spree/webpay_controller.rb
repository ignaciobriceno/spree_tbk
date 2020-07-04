module Spree
  class WebpayController < StoreController
    skip_before_action :verify_authenticity_token
    before_action :load_data
    
    def webpay_return_url
      trx_result = ''
    end
    
    private
    def load_data
      debugger
      #@payment = Spree::Payment.find_by(params["token_ws"])
    end
    
    def completion_route
      spree.order_path(@order)
    end
  end
end
