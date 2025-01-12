CREATE TABLE preference_companionship (
  user_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary identifier token, hexadecimal characters',
  indiapp_id VARCHAR(255) COMMENT 'Associated IndiApp ID, hexadecimal characters',
  city VARCHAR(255) COMMENT 'User city',
  coordinates POINT COMMENT 'User current coordinates',
  on_site BOOLEAN COMMENT 'Indicates whether on-site service is available',
  max_distance FLOAT COMMENT 'Maximum service distance in kilometers',
  local_type ENUM('on-site', 'hang_out', 'hotel', 'residential_hotel', 'appartement') COMMENT 'Type of location where services are provided, if no location is set by the provider, matching cannot occur',
  rdv TIME COMMENT 'Available service time range',
  services JSON COMMENT 'List of required services',
  service_time TIME COMMENT 'Required service duration',
  price_min FLOAT COMMENT 'Minimum price for the required services',
  price_max FLOAT COMMENT 'Maximum price for the required services',
  currency ENUM('USD', 'EUR', 'JPY', 'GBP', 'AUD', 'CAD', 'CHF', 'CNY', 'HKD', 'NZD', 'KRW', 'SGD', 'SEK', 'NOK', 'MXN', 'INR', 'RUB', 'ZAR', 'BRL', 'TRY', 'TWD', 'DKK', 'PLN', 'THB', 'IDR', 'HUF', 'CZK', 'ILS', 'MYR', 'PHP', 'PKR', 'CLP', 'AED', 'SAR', 'COP', 'EGP', 'VND', 'BDT', 'KWD', 'QAR', 'UAH', 'PEN', 'MAD', 'NGN', 'KZT', 'ARS', 'DZD', 'LKR', 'OMR', 'BHD') COMMENT 'Default currency',
  trust_score_min FLOAT COMMENT 'Minimum trust score required',
  gender SET('male', 'female', 'other') COMMENT 'Target gender list',
  age_min FLOAT COMMENT 'Minimum target age',
  age_max FLOAT COMMENT 'Maximum target age',
  nationality JSON COMMENT 'List of target nationalities',
  languages JSON COMMENT 'Languages and proficiency levels in JSON format, e.g., [{"language": "English", "level": "Fluent"}, {"language": "Spanish", "level": "Beginner"}]',
  ethnicity SET('asian', 'arab', 'black', "white", 'south_asian', 'native_american', 'pacific_islander', 'hispanic', 'other', 'mixed')  COMMENT 'Ethnic information, stored as a set',
  education SET('none', 'primary', 'secondary', 'bachelor', 'master', 'doctorate') COMMENT 'Education level, refer to the personal table for values',
  profession SET('healthcare', 'education', 'engineering', 'business', 'arts', 'legal', 'marketing', 'it', 'public_service', 'sales', 'hospitality', 'fashion', 'transportation', 'customer_service', 'finance', 'construction', 'manufacturing', 'KOL_media', 'research', 'office_work', 'operations', 'logistics', 'public_relations', 'consulting', 'other') COMMENT 'Profession, refer to the personal table for values',
  style JSON COMMENT 'Personal style types',
  body_shape ENUM('petite', 'slim', 'average', 'curvy', 'athletic', 'plus_size') COMMENT 'Body shape',
  hair_color SET('black', 'brown', 'blonde', 'red', 'gray_and_white', 'vivid') COMMENT 'Hair color',
  hair_style SET('shaved', 'buzz_cut', 'short_straight', 'short_curly', 'bob', 'medium_straight', 'medium_curly', 'ponytail', 'bun', 'long_straight', 'long_curly', 'braids', 'dreadlocks', 'afro') COMMENT 'Hair style',
  eye_color SET('brown', 'blue', 'green', 'hazel', 'gray') COMMENT 'Eye color',
  skin_color SET('pale', 'olive', 'brown', 'ebony') COMMENT 'Skin color',
  NSFW_interest JSON COMMENT 'NSFW interests stored as an array'
);

CREATE TABLE indiapp_info (
  indiapp_id VARCHAR(255) PRIMARY KEY COMMENT 'Primary identifier token, hexadecimal characters',
  client_secret VARCHAR(255) COMMENT 'OAuth client secret for application authentication',
  type VARCHAR(255) COMMENT 'Primary service category',
  sub_type VARCHAR(255) COMMENT 'Secondary service category',
  tertiary_type VARCHAR(255) COMMENT 'Tertiary service category',  
  description TEXT COMMENT 'Detailed description of the IndiApp',
  icon_url VARCHAR(255) COMMENT 'URL of the IndiApp icon',
  website_url VARCHAR(255) COMMENT 'Official website URL of the IndiApp',
  version VARCHAR(50) COMMENT 'Current version of the IndiApp',
  developer_user_id VARCHAR(255) COMMENT 'Unique identifier for the developer or company',
  privacy_policy_url VARCHAR(255) COMMENT 'URL to the privacy policy',
  terms_of_service_url VARCHAR(255) COMMENT 'URL to the terms of service',
  platform SET('iOS', 'Android', 'Web', 'Windows', 'Mac', 'Linux') COMMENT 'Platforms the IndiApp is available on',
  supported_languages JSON COMMENT 'JSON array of supported languages, e.g., ["English", "Spanish", "French"]',
  tags JSON COMMENT 'JSON array of tags associated with the IndiApp',
  is_active BOOLEAN COMMENT 'Indicates if the IndiApp is currently active',
  minimum_age INT COMMENT 'Minimum age required to use the IndiApp',
  redirect_uri VARCHAR(255) COMMENT 'Callback URL after successful authorization',
  requested_scopes JSON COMMENT 'List of permission scopes requested by the application',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Record creation timestamp',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Record last update timestamp'
);

-- Create OAuth authorizations table
CREATE TABLE oauth_authorizations (
  id VARCHAR(255) PRIMARY KEY COMMENT 'Primary key',
  user_id VARCHAR(255) COMMENT 'ID of the user granting authorization',
  indiapp_id VARCHAR(255) COMMENT 'OAuth client ID reference to oauth_applications',
  authorized_scopes JSON COMMENT 'List of permission scopes granted by the user',
  authorization_code VARCHAR(255) COMMENT 'Temporary code used for OAuth authorization code flow',
  code_expires_at DATETIME COMMENT 'Expiration timestamp for the authorization code',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Record creation timestamp',
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Record last update timestamp'
);

CREATE INDEX idx_oauth_authorizations_user_client ON oauth_authorizations(user_id, indiapp_id);
CREATE INDEX idx_oauth_authorizations_code ON oauth_authorizations(authorization_code);
