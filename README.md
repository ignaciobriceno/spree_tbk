# Spree Webpay — historical adaptation

In 2020, I adapted an existing Spree extension to connect an e-commerce checkout with Webpay, a local payment service. At the time, this integration used the provider's SDK through `libwebpay`, rather than a direct REST API.

## My contribution

- Added delivery-area and address validation to checkout.
- Extended payment callbacks to update payment, order and shipment states.
- Connected successful payments with shipping dispatch and tracking, and adapted the payment-failure view.

Built on [sbstn-jmnz/spree_tbk](https://github.com/sbstn-jmnz/spree_tbk). See [my changes against that base](https://github.com/ignaciobriceno/spree_tbk/compare/b3225659b5ce717de99fbac5c77a49702ae8c9b2...eb749ebe06239cc3bfda53ef9711b51cfd3f1a55).

Historical reference. Store-specific shipping components are not included, and current compatibility and tests have not been verified. The existing [license](LICENSE) is preserved.
