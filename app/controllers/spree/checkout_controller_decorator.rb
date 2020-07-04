module Spree
  module CheckoutControllerDecorator
    def update
      if payment_valid_params? && paying_with_webpay?
        provider       = payment_method.provider.new
        amount         = @order.webpay_amount
        init_trx = provider.init_normal_transaction(amount, @order.number, session.id)
        if init_trx["error_desc"] == "TRX_OK"
          response = Net::HTTP.post_form(URI(init_trx["url"]), token_ws: init_trx["token"])
          render html: response.body.html_safe
        else
         render :edit 
        end
      else
        super       
      end
    end

    private

    def payment_method
      PaymentMethod.find(payment_method_id)
    end
    
    def paying_with_webpay?
      payment_method.is_a? Gateway::SpreeTbk
    end

    def payment_method_id
      params[:order][:payments_attributes].first[:payment_method_id]
    end

    def payment_valid_params?
      params[:state] == 'payment' and @order.state == 'payment'
    end
  end
end

::Spree::CheckoutController.prepend(Spree::CheckoutControllerDecorator)