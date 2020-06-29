module Webpay
  class Config
    attr_accessor :urlReturn, :urlFinal
    
    # Public: Loads the configuration file tbk-webpay.yml
    # If it's a rails application it will take the file from the config/ directory
    #
    # env - Environment.
    #
    # Returns a Config object.
    def initialize
      config = Libwebpay.Configuration
      config.commerce_code = Rails.application.credentials.webpay_commerce_code
      config.environment = Rails.application.credentials.environment
      config.private_key = OpenSSL::PKey::RSA.new(File.read(Rails.application.credentials.webpay_client_private_key))
      config.public_cert = OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_client_certificate))
      config.webpay_cert = OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_tbk_certificate))
      puts 'commerce code: ' + Rails.application.credentials.webpay_commerce_code.to_s
      puts 'env: ' + Rails.application.credentials.environment.to_s
      puts 'private_key: ' + OpenSSL::PKey::RSA.new(File.read(Rails.application.credentials.webpay_client_private_key)).to_s
      puts 'public_cert: ' + OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_client_certificate)).to_s
      puts 'webpay_cert: ' + OpenSSL::X509::Certificate.new(File.read(Rails.application.credentials.webpay_tbk_certificate)).to_s
      @urlReturn = base_url + Rails.application.credentials.webpay_return_url.to_s
      @urlFinal = base_url + Rails.application.credentials.webpay_final_url.to_s
    end
  end
end
