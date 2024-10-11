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
  whatsapp_phone_number VARCHAR(255) COMMENT 'WhatsApp phone number',https://github.com/VTI3/database/blob/main/user.sql
  phone_verified BOOLEAN COMMENT 'Whether the phone number has been verified',
  region_number VARCHAR(10) COMMENT 'Phone number region code',
  phone_number VARCHAR(20) COMMENT 'Phone number',
  email_verified BOOLEAN COMMENT 'Whether the email address has been verified',
  email_address VARCHAR(255) COMMENT 'Email address',
  telegram_handle VARCHAR(255) COMMENT 'Telegram username',
  telegram_phone_number VARCHAR(20) COMMENT 'Phone number used for Telegram login'
);

CREATE TABLE subscriptions (
  id VARCHAR(255) COMMENT 'ID of the subscriber',
  subscriber_id VARCHAR(255) COMMENT 'ID of the subscriber',
  subscribed_id VARCHAR(255) COMMENT 'ID of the person being subscribed to',
  method SET('google', 'facebook', 'instagram', 'twitter', 'tiktok', 'apple_id', 'whatsapp', 'phone_number', 'email', 'telegram') COMMENT 'Platforms where the subscription exists ["instagram", "facebook"]',
  created_at DATETIME COMMENT 'Subscription creation timestamp, used for sorting'
);

CREATE TABLE referral_infos (
  id VARCHAR(255) COMMENT 'Associated user ID',
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
  user_id VARCHAR(255) COMMENT 'Associated user ID',
  offer_type JSON COMMENT 'Offer type stored in JSON format'
);
  
CREATE TABLE personal (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Associated user ID',
  gender ENUM('male', 'female', 'other') COMMENT 'Gender',
  birth_day DATE COMMENT 'Birth date',
  nationality JSON COMMENT 'Nationalities stored as an array',
  ethnicity SET('asian', 'arab', 'black', "white", 'south_asian', 'native_american', 'pacific_islander', 'hispanic', 'other') COMMENT 'Ethnic information, stored as a set',
  education ENUM('none', 'primary', 'secondary', 'bachelor', 'master', 'doctorate') COMMENT 'Education level',
  profession ENUM('healthcare', 'education', 'engineering', 'business', 'arts', 'legal', 'marketing', 'it', 'public_service', 'sales', 'hospitality', 'fashion', 'transportation', 'customer_service', 'finance', 'construction', 'manufacturing', 'KOL_media', 'research', 'office_work', 'operations', 'logistics', 'public_relations', 'consulting', 'other') COMMENT 'Profession',
  languages JSON COMMENT 'Languages with proficiency levels in JSON format, e.g., [{"language": "English", "level": "Fluent"}, {"language": "Spanish", "level": "Beginner"}]',
  sexual_orientation ENUM('heterosexual', 'homosexual', 'bisexual', 'queer') COMMENT 'Sexual orientation',
  interest JSON COMMENT 'Interests stored as an array',
  style JSON COMMENT 'Personal style types',
  my_type JSON COMMENT 'Preferred personality types',
  hair_color ENUM('black', 'brown', 'blonde', 'red', 'gray_and_white', 'vivid') COMMENT 'Hair color',
  hair_style ENUM('shaved', 'buzz_cut', 'short_straight', 'short_curly', 'bob', 'medium_straight', 'medium_curly', 'ponytail', 'bun', 'long_straight', 'long_curly', 'braids', 'dreadlocks', 'afro') COMMENT 'Hair style',
  eye_color ENUM('brown', 'blue', 'green', 'hazel') COMMENT 'Eye color',
  skin_color ENUM('pale', 'olive', 'brown', 'ebony') COMMENT 'Skin color',
  height FLOAT COMMENT 'Height in meters',
  weight FLOAT COMMENT 'Weight in kilograms',
  bust FLOAT COMMENT 'Bust size in centimeters',
  waist FLOAT COMMENT 'Waist size in centimeters',
  hips FLOAT COMMENT 'Hip size in centimeters',
  body_shape ENUM('petite', 'slim', 'average', 'curvy', 'athletic', 'plus_size') COMMENT 'Body shape',
  bra_size ENUM('A', 'B', 'C', 'D', 'DD', 'E', 'F', 'G', 'H') COMMENT 'Bra size',
  plastic_surgery ENUM('none', 'mild', 'moderate', 'extensive') COMMENT 'Plastic surgery status',
  tattoos ENUM('none', 'mild', 'moderate', 'extensive') COMMENT 'Tattoo status',
  piercings ENUM('none', 'mild', 'moderate', 'extensive') COMMENT 'Piercing status'
);
