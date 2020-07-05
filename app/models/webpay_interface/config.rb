module WebpayInterface
  class Config
    attr_reader :commerce_code, 
                :environment,
                :private_key, 
                :public_cert, 
                :webpay_cert, 
                :urlReturn,
                :urlFinal
    def initialize
      base_url = Rails.env.production? ? Rails.application.credentials.base_url : 'http://localhost:3000'
      @commerce_code = Rails.application.credentials.webpay_commerce_code
      @environment = Rails.application.credentials.environment
      @private_key = OpenSSL::PKey::RSA.new(File.read(Rails.application.credentials.webpay_client_private_key))
      @public_cert = OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_client_certificate))
      @webpay_cert = OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_tbk_certificate))
      @urlReturn = base_url + Rails.application.credentials.webpay_return_url.to_s
      @urlFinal = base_url + Rails.application.credentials.webpay_final_url.to_s
    end
  end
end

