module Spree
  module PaymentDecorator
    def self.prepend(base)
      scope :from_webpay, -> { joins(:payment_method).where(spree_payment_methods: {type: Spree::Gateway::SpreeTbk.to_s}) }
      after_initialize :set_webpay_trx_id
    end

    def webpay?
      self.payment_method.type == "Spree::Gateway::SpreeTbk"
    end
    
    def webpay_card_number
      "XXXX XXXX XXXX #{webpay_params['TBK_FINAL_NUMERO_TARJETA']}"
    end
    
    private
    # Public: Setea un trx_id unico.
    #
    # Returns Token.
    def set_webpay_trx_id
      self.webpay_trx_id ||= generate_webpay_trx_id
    end
    
    # Public: Genera el trx_id unico.
    #
    # Returns generated trx_id.
    def generate_webpay_trx_id
      Digest::MD5.hexdigest("#{self.order.number}#{self.order.payments.count}")
    end
  end
end

::Spree::Payment.prepend(Spree::PaymentDecorator)