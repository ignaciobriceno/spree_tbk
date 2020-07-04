module WebpayInterface
  class Payment
    def initialize
      @webpay ||= Libwebpay.Webpay(WebpayInterface::Config.new)
    end
    
    # Public: Initial communication from the application to Webpay
    #
    # tbk_total_price - integer - Total amount of the purchase. Last two digits are considered decimals.
    # tbk_order_id - integer - The purchase order id.
    # session_id - integer - The user session id.
    #
    # Returns a hash like:
    # {
    #  "token"=>"e38c6e07ccae238653bc6c78d23faaa670f83b0273430877828e7f237470e1ff",
    #  "url"=>"https://webpay3gint.transbank.cl/webpayserver/initTransaction",
    #  "error_desc"=>"TRX_OK"
    # }
    def init_normal_transaction tbk_total_price, order_id, session_id
      amount = tbk_total_price 
      @webpay.NormalTransaction.initTransaction(
      tbk_total_price,
      order_id,
      session_id,
      @webpay.config.urlReturn,
      @webpay.config.urlFinal)
    end
  end
end