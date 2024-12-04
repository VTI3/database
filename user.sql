CREATE TABLE user_accounts (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary identifier token, hexadecimal characters',
  manager_id VARCHAR(255) COMMENT 'The user id who manager this account',
  user_state ENUM('created', 'active', 'suspended', 'closed', 'banned', 'deleted', 'frozen', 'guest') COMMENT 'Account status',
  user_login_method JSON COMMENT 'Verified login methods; the first one is the default method (google, facebook, instagram, twitter, tiktok, apple_id, whatsapp, phone_number, email, telegram)',
  username VARCHAR(255) UNIQUE COMMENT 'Unique username identifier',
  profile_picture VARCHAR(255) COMMENT 'URL of user profile picture',
  bio VARCHAR(255) COMMENT 'User biography',
  pin VARCHAR(255) COMMENT 'PIN code',
  created_at DATETIME COMMENT 'Account creation timestamp',
  created_method ENUM('claim_invited', 'claim_provider_order', 'claim_provider_kol', 'claim_user_receive_money', 'claim_user_check_trust', 'register_invited', 'register_unknown_user', 'register_check_trust', 'register_indiapp_user', 'register_indiapp_provider') COMMENT 'Method used to create the account',
  claimed_at DATETIME COMMENT 'Timestamp when the user claimed the account',
  claimed_method ENUM('google', 'facebook', 'instagram', 'twitter', 'tiktok', 'apple_id', 'whatsapp', 'phone_number', 'email', 'telegram') COMMENT 'Method used to claim the account',
  updated_at DATETIME COMMENT 'Last updated timestamp',
  updated_method ENUM('by_vti3', 'by_indiapp', 'by_other', 'by_api', 'by_admin') COMMENT 'Method used for the last update'
);

CREATE TABLE login_methods (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Associated user ID',
  google_id VARCHAR(255) COMMENT 'Google User ID token',
  google_email VARCHAR(255) COMMENT 'Google email address',
  facebook_id VARCHAR(255) COMMENT 'Facebook User ID',
  facebook_email VARCHAR(255) COMMENT 'Facebook email address',
  instagram_id VARCHAR(255) COMMENT 'Instagram User ID',
  instagram_username VARCHAR(255) COMMENT 'Instagram username',
  twitter_id VARCHAR(255) COMMENT 'Twitter User ID',
  twitter_username VARCHAR(255) COMMENT 'Twitter username',
  apple_id VARCHAR(255) COMMENT 'Apple User ID',
  whatsapp_phone_number VARCHAR(255) COMMENT 'WhatsApp phone number',
  phone_verified BOOLEAN COMMENT 'Whether the phone number has been verified',
  region_number VARCHAR(10) COMMENT 'Phone number region code',
  phone_number VARCHAR(20) COMMENT 'Phone number',
  email_verified BOOLEAN COMMENT 'Whether the email address has been verified',
  email_address VARCHAR(255) COMMENT 'Email address',
  telegram_handle VARCHAR(255) COMMENT 'Telegram username',
  telegram_phone_number VARCHAR(20) COMMENT 'Phone number used for Telegram login',
  telegram_channel VARCHAR(255) COMMENT 'Telegram channel',
  telegram_respond_bot VARCHAR(20) COMMENT 'Telegram respond bot ID'
);

CREATE TABLE subscriptions (
  subscriber_id VARCHAR(255) COMMENT 'ID of the subscriber',
  subscribed_id VARCHAR(255) COMMENT 'ID of the person being subscribed to',
  method SET('google', 'facebook', 'instagram', 'twitter', 'tiktok', 'apple_id', 'whatsapp', 'phone_number', 'email', 'telegram') COMMENT 'Platforms where the subscription exists ["instagram", "facebook"]',
  created_at DATETIME COMMENT 'Subscription creation timestamp, used for sorting'
);

CREATE TABLE referral_infos (
  referrer_id VARCHAR(255) COMMENT 'ID of the first referrer',
  referee_id VARCHAR(255) COMMENT 'User ID of the first referee, in hexadecimal format',
  method ENUM('event', 'messaging_app', 'social', 'email_invite', 'sms_invite', 'indi-app', 'import_provider') COMMENT 'Method used by the referrer to make the referral',
  created_at DATETIME COMMENT 'Referral creation timestamp, used for sorting'
);

CREATE TABLE settings_indiapp (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Associated user ID',
  indiapp_id VARCHAR(255) COMMENT 'Associated IndiApp ID',
  setting JSON COMMENT 'Preferences stored in JSON format'
);

CREATE TABLE preferences (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Associated user ID',
  offer_type JSON COMMENT 'Offer type stored in JSON format'
);

CREATE TABLE offer_action ( 
  user_id VARCHAR(255) COMMENT 'ID of the user', 
  offer_id VARCHAR(255) COMMENT 'ID of the offer that the user acted to', 
 type VARCHAR(255) COMMENT 'Primary service category',
  sub_type VARCHAR(255) COMMENT 'Secondary service category',
  tertiary_type VARCHAR(255) COMMENT 'Tertiary service category',
  action ENUM('passed', 'liked', 'favorited', 'contacted', 'bought', 'reviewed', 'banned', 'refund') COMMENT 'How the user react to the offer', 
  action_at DATETIME COMMENT 'Action timestamp, used for sorting' 
);
