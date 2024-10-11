CREATE TABLE wallet (
  user_id VARCHAR(255) COMMENT 'Associated user ID',
  wallet_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary identifier token, hexadecimal string',
  wallet_currency ENUM("USD", "EUR", "JPY", "GBP", "AUD", "CAD", "CHF", "CNY", "HKD", "NZD", 
                 "KRW", "SGD", "SEK", "NOK", "MXN", "INR", "RUB", "ZAR", "BRL", "TRY",
                 "TWD", "DKK", "PLN", "THB", "IDR", "HUF", "CZK", "ILS", "MYR", "PHP", 
                 "PKR", "CLP", "AED", "SAR", "COP", "EGP", "VND", "BDT", "KWD", "QAR", 
                 "UAH", "PEN", "MAD", "NGN", "KZT", "ARS", "DZD", "LKR", "OMR", "BHD", 
                 "ETB", "CDF", "MMK", "KES", "GHS", "NPR", "VES", "IQD", "TZS") COMMENT 'Default currency for accounting',
  last_withdrew_method ENUM('bank_transfer_withdrawal', 'credit_card_withdrawal', 'c2c_withdrawal', 'cryptocurrency_withdrawal', 'third_party_payment_withdrawal') COMMENT 'Last withdrawal method used',
  last_request_state ENUM('bank_transfer', 'credit_card', 'c2c_transfer', 'cryptocurrency', 'third_party_payment', 'invoice_bill_code_generation') COMMENT 'Last method used for incoming funds',
);

CREATE TABLE balances (
  balances_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  balance_usd FLOAT COMMENT 'USD balance - United States',
  balance_eur FLOAT COMMENT 'EUR balance - Eurozone (19 countries)',
  balance_jpy FLOAT COMMENT 'JPY balance - Japan',
  balance_gbp FLOAT COMMENT 'GBP balance - United Kingdom',
  balance_aud FLOAT COMMENT 'AUD balance - Australia',
  balance_cad FLOAT COMMENT 'CAD balance - Canada',
  balance_chf FLOAT COMMENT 'CHF balance - Switzerland & Liechtenstein',
  balance_cny FLOAT COMMENT 'CNY balance - China',
  balance_hkd FLOAT COMMENT 'HKD balance - Hong Kong',
  balance_nzd FLOAT COMMENT 'NZD balance - New Zealand',
  balance_krw FLOAT COMMENT 'KRW balance - South Korea',
  balance_sgd FLOAT COMMENT 'SGD balance - Singapore',
  balance_sek FLOAT COMMENT 'SEK balance - Sweden',
  balance_nok FLOAT COMMENT 'NOK balance - Norway',
  balance_mxn FLOAT COMMENT 'MXN balance - Mexico',
  balance_inr FLOAT COMMENT 'INR balance - India',
  balance_rub FLOAT COMMENT 'RUB balance - Russia',
  balance_zar FLOAT COMMENT 'ZAR balance - South Africa',
  balance_brl FLOAT COMMENT 'BRL balance - Brazil',
  balance_try FLOAT COMMENT 'TRY balance - Turkey',
  balance_twd FLOAT COMMENT 'TWD balance - Taiwan',
  balance_dkk FLOAT COMMENT 'DKK balance - Denmark',
  balance_pln FLOAT COMMENT 'PLN balance - Poland',
  balance_thb FLOAT COMMENT 'THB balance - Thailand',
  balance_idr FLOAT COMMENT 'IDR balance - Indonesia',
  balance_huf FLOAT COMMENT 'HUF balance - Hungary',
  balance_czk FLOAT COMMENT 'CZK balance - Czech Republic',
  balance_ils FLOAT COMMENT 'ILS balance - Israel',
  balance_myr FLOAT COMMENT 'MYR balance - Malaysia',
  balance_php FLOAT COMMENT 'PHP balance - Philippines',
  balance_pkr FLOAT COMMENT 'PKR balance - Pakistan',
  balance_clp FLOAT COMMENT 'CLP balance - Chile',
  balance_aed FLOAT COMMENT 'AED balance - United Arab Emirates',
  balance_sar FLOAT COMMENT 'SAR balance - Saudi Arabia',
  balance_cop FLOAT COMMENT 'COP balance - Colombia',
  balance_egp FLOAT COMMENT 'EGP balance - Egypt',
  balance_vnd FLOAT COMMENT 'VND balance - Vietnam',
  balance_bdt FLOAT COMMENT 'BDT balance - Bangladesh',
  balance_kwd FLOAT COMMENT 'KWD balance - Kuwait',
  balance_qar FLOAT COMMENT 'QAR balance - Qatar',
  balance_uah FLOAT COMMENT 'UAH balance - Ukraine',
  balance_pen FLOAT COMMENT 'PEN balance - Peru',
  balance_mad FLOAT COMMENT 'MAD balance - Morocco',
  balance_ngn FLOAT COMMENT 'NGN balance - Nigeria',
  balance_kzt FLOAT COMMENT 'KZT balance - Kazakhstan',
  balance_ars FLOAT COMMENT 'ARS balance - Argentina',
  balance_dzd FLOAT COMMENT 'DZD balance - Algeria',
  balance_lkr FLOAT COMMENT 'LKR balance - Sri Lanka',
  balance_omr FLOAT COMMENT 'OMR balance - Oman',
  balance_bhd FLOAT COMMENT 'BHD balance - Bahrain',
  balance_coupon FLOAT COMMENT 'Coupon balance, can be used to offset platform fees'
);
  
CREATE TABLE credit_cards (
  card_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  card_number VARCHAR(255) COMMENT 'Credit card number',
  expiration_date VARCHAR(255) COMMENT 'Expiration date (MM/YY)',
  name VARCHAR(255) COMMENT 'Cardholder name',
  cvv VARCHAR(255) COMMENT 'Card security code',
  address_line1 VARCHAR(255) COMMENT 'Billing address line 1',
  address_line2 VARCHAR(255) COMMENT 'Billing address line 2',
  city VARCHAR(255) COMMENT 'City',
  postal_code VARCHAR(20) COMMENT 'Postal code',
  country VARCHAR(255) COMMENT 'Country'
);

CREATE TABLE swifts (
  swift_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account_name VARCHAR(255) COMMENT 'Account holder name',
  swift_bic VARCHAR(255) COMMENT 'SWIFT/BIC number',
  account_number VARCHAR(255) COMMENT 'Account number (IBAN)',
  bank_name VARCHAR(255) COMMENT 'Bank name (automatically fetched from BIC)',
  bank_address VARCHAR(255) COMMENT 'Bank address (automatically fetched from BIC)'
);

CREATE TABLE sepas (
  sepa_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account_name VARCHAR(255) COMMENT 'Account holder name',
  swift_bic VARCHAR(255) COMMENT 'SWIFT/BIC code',
  account_number VARCHAR(255) COMMENT 'IBAN number',
  bank_name VARCHAR(255) COMMENT 'Bank name (automatically fetched from BIC)',
  bank_address VARCHAR(255) COMMENT 'Bank address (automatically fetched from BIC)'
);

CREATE TABLE achs (
  ach_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account_name VARCHAR(255) COMMENT 'Account holder name',
  routing_number VARCHAR(255) COMMENT 'Bank routing number',
  swift_bic VARCHAR(255) COMMENT 'SWIFT/BIC code',
  account_number VARCHAR(255) COMMENT 'BAN number',
  bank_name VARCHAR(255) COMMENT 'Bank name (automatically fetched from BIC)',
  bank_address VARCHAR(255) COMMENT 'Bank address (automatically fetched from BIC)'
);

CREATE TABLE paypals (
  paypal_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account VARCHAR(255) COMMENT 'Account name',
  access_token VARCHAR(255) COMMENT 'API access token'
);

CREATE TABLE stripes (
  stripe_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account VARCHAR(255) COMMENT 'Account name',
  access_token VARCHAR(255) COMMENT 'API access token'
);

CREATE TABLE adyens (
  adyen_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  account VARCHAR(255) COMMENT 'Account name',
  access_token VARCHAR(255) COMMENT 'API access token'
);

CREATE TABLE crypto_eth (
  eth_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  wallet_address VARCHAR(255) COMMENT 'ETH wallet address',
  token_address VARCHAR(255) COMMENT 'Token address'
);

CREATE TABLE crypto_ton (
  ton_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  wallet_address VARCHAR(255) COMMENT 'TON wallet address',
  token_address VARCHAR(255) COMMENT 'Token address'
);

CREATE TABLE crypto_bsc (
  bsc_id VARCHAR(255) PRIMARY KEY,
  wallet_id VARCHAR(255) COMMENT 'Associated wallet ID',
  wallet_address VARCHAR(255) COMMENT 'BSC wallet address',
  token_address VARCHAR(255) COMMENT 'Token address'
);

CREATE TABLE transactions (
  tx_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary identifier token, hexadecimal string',
  order_id VARCHAR(255) COMMENT 'Associated order ID',
  nsfw_archived BOOLEAN COMMENT 'Whether the transaction is hidden',
  deleted BOOLEAN COMMENT 'Whether the transaction is deleted',
  tx_state ENUM('pending', 'finished', 'cancelled', 'hidden', 'refunded') COMMENT 'State of the transaction',
  tx_method ENUM('direct_payment', 'escrow_payment', 'subscription_payment') COMMENT 'Method used for the transaction',
  created_by VARCHAR(255) COMMENT 'Primary identifier token, hexadecimal string',
  tx_from VARCHAR(255) COMMENT 'Sender ID, primary identifier token, hexadecimal string',
  tx_to VARCHAR(255) COMMENT 'Receiver ID, primary identifier token, hexadecimal string',
  created_at DATETIME COMMENT 'Transaction creation timestamp',
  created_method ENUM('by_vti3', 'by_indiapp', 'by_other', 'by_api', 'by_admin') COMMENT 'Method used to create the transaction',
  finished_at DATETIME COMMENT 'Transaction completion timestamp',
  finished_method ENUM('direct', 'manual', 'automatic', 'admin') COMMENT 'Method used to complete the transaction',
  updated_at DATETIME COMMENT 'Transaction update timestamp',
  updated_method ENUM('deleted', 'modified') COMMENT 'Method used to update the transaction',
  price FLOAT COMMENT 'Transaction amount',
  currency ENUM('USD', 'EUR', 'JPY', 'GBP', 'AUD', 'CAD', 'CHF', 'CNY', 'HKD', 'NZD', 'KRW', 'SGD', 'SEK', 'NOK', 'MXN', 'INR', 'RUB', 'ZAR', 'BRL', 'TRY', 'TWD', 'DKK', 'PLN', 'THB', 'IDR', 'HUF', 'CZK', 'ILS', 'MYR', 'PHP', 'PKR', 'CLP', 'AED', 'SAR', 'COP', 'EGP', 'VND', 'BDT', 'KWD', 'QAR', 'UAH', 'PEN', 'MAD', 'NGN', 'KZT', 'ARS', 'DZD', 'LKR', 'OMR', 'BHD') COMMENT 'Currency type (USD, EUR, CNY, etc.)'
);

CREATE TABLE related_transactions (
  tx_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary transaction ID, hexadecimal string',
  related_tx_id VARCHAR(255) COMMENT 'Related transaction ID, hexadecimal string',
  method ENUM('promotion', 'air_drop', 'coupon', 'cashback', 'refund', 'bonus', 'discount') COMMENT 'Method for the related transaction'
);

CREATE TABLE dependent_transactions (
  tx_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary transaction ID, hexadecimal string',
  dependent_tx_id VARCHAR(255) COMMENT 'Transaction dependency ID, hexadecimal string',
  method ENUM('promotion', 'air_drop', 'coupon', 'cashback', 'refund', 'bonus', 'discount') COMMENT 'Dependency method'
);

CREATE TABLE orders (
  order_id VARCHAR(255) PRIMARY KEY COMMENT 'Order ID, hexadecimal string',
  nsfw_archived BOOLEAN COMMENT 'Whether the order is hidden',
  deleted BOOLEAN COMMENT 'Whether the order is deleted',
  order_state ENUM('created', 'pending', 'finished', 'cancelled', 'refunded', 'hidden') COMMENT 'State of the order',
  order_method ENUM('direct_payment', 'escrow_payment', 'subscription_payment') COMMENT 'Payment method used for the order',
  referrer_user_id VARCHAR(255) COMMENT 'ID of the user who referred the order, hexadecimal string',
  referrer_method ENUM('event', 'messaging_app', 'social', 'email_invite', 'sms_invite', 'indi-app', 'import_provider') COMMENT 'Method used to refer the order',
  created_by VARCHAR(255) COMMENT 'ID of the user who created the order, hexadecimal string',
  order_from VARCHAR(255) COMMENT 'Sender ID, hexadecimal string',
  order_to VARCHAR(255) COMMENT 'Receiver ID, hexadecimal string',
  created_at DATETIME COMMENT 'Order creation timestamp',
  created_method ENUM('by_user', 'by_admin', 'by_referral', 'by_api', 'by_indiapp') COMMENT 'Method used to create the order',
  finished_at DATETIME COMMENT 'Order completion timestamp',
  finished_method ENUM('direct', 'escrow', 'subscription', 'manual') COMMENT 'Method used to complete the order',
  updated_at DATETIME COMMENT 'Order update timestamp',
  updated_method ENUM('modified', 'deleted') COMMENT 'Method used to update the order'
);

CREATE TABLE order_details (
  order_id VARCHAR(255) PRIMARY KEY COMMENT 'Associated order ID, hexadecimal string',
  tx_id VARCHAR(255) COMMENT 'Associated transaction ID, hexadecimal string',
  tx_method ENUM('direct_payment', 'escrow_payment', 'subscription_payment') COMMENT 'Transaction method associated with the order',
  promotion_id VARCHAR(255) COMMENT 'Associated promotion ID, hexadecimal string',
  promotion_method ENUM('single_use', 'percentage_promotion', 'direct_discount_promotion') COMMENT 'Promotion method associated with the order',
  promotion_amount FLOAT COMMENT 'Promotion amount',
  amount_state ENUM('before_promotion', 'after_promotion') COMMENT 'Timing of promotion application',
  offer_id VARCHAR(255) COMMENT 'Associated offer, hexadecimal string',
  offer_option_id VARCHAR(255) COMMENT 'Offer option associated with the order, hexadecimal string',
  offer_amount FLOAT COMMENT 'Amount associated with the offer',
  escrow_updated_at DATETIME COMMENT 'Escrow status update timestamp',
  escrow_updated_method ENUM('status_update', 'manual_adjustment', 'automatic') COMMENT 'Method used to update escrow status',
  escrow_updated_by VARCHAR(255) COMMENT 'Escrow status updated by, hexadecimal string',
  escrow_end_at DATETIME COMMENT 'Escrow end date',
  escrow_end_method ENUM('completion', 'cancellation', 'refund', 'dispute_resolution') COMMENT 'Method used to end escrow',
  escrow_history_tx_ids JSON COMMENT 'Transaction history of the escrow',
  subscription_interval TIMESTAMP COMMENT 'Subscription interval',
  subscription_interval_start TIMESTAMP COMMENT 'Subscription interval start timestamp',
  subscription_interval_end TIMESTAMP COMMENT 'Subscription interval end timestamp',
  subscription_interval_max FLOAT COMMENT 'Maximum amount within the subscription interval',
  subscription_interval_paid FLOAT COMMENT 'Amount paid within the current subscription interval',
  subscription_end_at DATETIME COMMENT 'Subscription end timestamp',
  subscription_end_method ENUM('user_cancelled', 'auto_expire', 'admin_terminated') COMMENT 'Reason for subscription termination',
  subscription_history_tx_ids JSON COMMENT 'Transaction history for the subscription'
);
