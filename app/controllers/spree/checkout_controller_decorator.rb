module Spree
  module CheckoutControllerDecorator
    def update
      @payment = @order.payments.order(:id).last
      
      if params[:state] == 'payment' and @order.state == 'payment'
        payment_method = @order.webpay_payment_method
        trx_id         = @payment.webpay_trx_id
        amount         = @order.webpay_amount
        provider       = payment_method.provider.new
        response       = provider.init_normal_transaction(amount, @order.number, trx_id)
        
        respond_to do |format|
          format.html { render text: response }
        end       
      end
    end
  end
end

::Spree::CheckoutController.prepend(Spree::CheckoutControllerDecorator)