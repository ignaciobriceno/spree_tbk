module Spree
  class WebpayController < StoreController
    skip_before_action :verify_authenticity_token
    before_action :load_data
    
    def webpay_return_url
      trx_result = ''
    end
    
    def webpay_final_url
      debugger
    end

    private
    def load_data
      debugger
      PaymentMethod.find_by_name('TransbankWebpay')
      @payment = Spree::Payment.find_by(params["token_ws"])
    end
    
    def completion_route
      spree.order_path(@order)
    end
  end
end
