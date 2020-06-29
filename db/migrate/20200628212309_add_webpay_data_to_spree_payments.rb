class AddWebpayDataToSpreePayments < SpreeExtension::Migration
  def up
    execute 'CREATE EXTENSION IF NOT EXISTS hstore'
    #add_column :spree_payments, :webpay_params, :hstore
    add_column :spree_payments, :webpay_trx_id, :string
  end

  def down
    #remove_column :spree_payments, :webpay_params
    remove_column :spree_payments, :webpay_trx_id
    execute 'DROP EXTENSION hstore'
  end
end
