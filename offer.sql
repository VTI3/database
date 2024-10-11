CREATE TABLE offer (
  offer_id VARCHAR(255) PRIMARY KEY COMMENT 'Service ID, hexadecimal string',
  type VARCHAR(255) COMMENT 'Primary service category',
  sub_type VARCHAR(255) COMMENT 'Secondary service category',
  tertiary_type VARCHAR(255) COMMENT 'Tertiary service category',
  metadata JSON COMMENT 'Service metadata ["options", "location"]',
  offer_media JSON COMMENT 'Array of URLs for service media',
  created_at DATETIME COMMENT 'Timestamp when the service was created',
  created_method ENUM('by_indiapp', 'by_user') COMMENT 'Method by which the service was created',
  claimed_at DATETIME COMMENT 'Timestamp when the service was claimed',
  claimed_method ENUM('by_user', 'by_provider') COMMENT 'Method by which the service was claimed',
  updated_at DATETIME COMMENT 'Timestamp when the service was last updated',
  updated_method ENUM('manual', 'automatic') COMMENT 'Method by which the service was updated',
  trust_scores FLOAT COMMENT 'Trust score for the service',
  options JSON COMMENT 'Various options for the service'
);

CREATE TABLE provide_to (
  offer_id VARCHAR(255) PRIMARY KEY COMMENT 'Service ID, hexadecimal string',
  trust_score_min FLOAT COMMENT 'Minimum trust score required',
  gender SET('male', 'female', 'other') COMMENT 'Target gender list',
  age_min FLOAT COMMENT 'Minimum target age',
  age_max FLOAT COMMENT 'Maximum target age',
  nationality JSON COMMENT 'List of target nationalities',
  languages JSON COMMENT 'Languages and proficiency levels in JSON format, e.g., [{"language": "English", "level": "Fluent"}, {"language": "Spanish", "level": "Beginner"}]',
  ethnicity SET('asian', 'arab', 'black', 'caucasian', 'native_american', 'pacific_islander', 'hispanic', 'other') COMMENT 'Ethnic information, stored as a set',
  education SET('none', 'primary', 'secondary', 'bachelor', 'master', 'doctorate') COMMENT 'Education level, refer to the personal table for values',
  profession SET('healthcare', 'education', 'engineering', 'business', 'arts', 'legal', 'marketing', 'it', 'public_service', 'sales', 'hospitality', 'fashion', 'transportation', 'customer_service', 'finance', 'construction', 'manufacturing', 'KOL_media', 'research', 'office_work', 'operations', 'logistics', 'public_relations', 'consulting', 'other') COMMENT 'Profession, refer to the personal table for values'
);

CREATE TABLE location (
  offer_id VARCHAR(255) PRIMARY KEY COMMENT 'Service ID, hexadecimal string',
  city VARCHAR(255) COMMENT 'City where the service is available',
  coordinates POINT COMMENT 'Geographic coordinates where the service is available',
  on_site BOOLEAN COMMENT 'Indicates if on-site service is available',
  max_distance FLOAT COMMENT 'Maximum service distance in kilometers',
  local_type ENUM('apartment', 'house', 'office', 'outdoor') COMMENT 'Type of residence for on-site services'
);

CREATE TABLE availability (
  offer_id VARCHAR(255) PRIMARY KEY COMMENT 'Service ID, hexadecimal string, uniquely identifies the service',
  sun_time_start TIME COMMENT 'Service start time on Sunday',
  sun_time_end TIME COMMENT 'Service end time on Sunday',
  mon_time_start TIME COMMENT 'Service start time on Monday',
  mon_time_end TIME COMMENT 'Service end time on Monday',
  tue_time_start TIME COMMENT 'Service start time on Tuesday',
  tue_time_end TIME COMMENT 'Service end time on Tuesday',
  wed_time_start TIME COMMENT 'Service start time on Wednesday',
  wed_time_end TIME COMMENT 'Service end time on Wednesday',
  thu_time_start TIME COMMENT 'Service start time on Thursday',
  thu_time_end TIME COMMENT 'Service end time on Thursday',
  fri_time_start TIME COMMENT 'Service start time on Friday',
  fri_time_end TIME COMMENT 'Service end time on Friday',
  sat_time_start TIME COMMENT 'Service start time on Saturday',
  sat_time_end TIME COMMENT 'Service end time on Saturday',
  day_off JSON COMMENT 'Special holidays or custom dates where service is unavailable'
);

CREATE TABLE options (
  option_id VARCHAR(255) PRIMARY KEY COMMENT 'Option ID, hexadecimal string',
  offer_id VARCHAR(255) COMMENT 'ID of the associated service',
  option_name VARCHAR(255) COMMENT 'Name of the option',
  option_description VARCHAR(255) COMMENT 'Description of the option',
  related_offer_id VARCHAR(255) COMMENT 'ID of the related service',
  option_media JSON COMMENT 'Array of URLs for option media',
  price FLOAT COMMENT 'Price of the option',
  currency ENUM('USD', 'EUR', 'JPY', 'GBP', 'AUD', 'CAD', 'CHF', 'CNY', 'HKD', 'NZD', 'KRW', 'SGD', 'SEK', 'NOK', 'MXN', 'INR', 'RUB', 'ZAR', 'BRL', 'TRY', 'TWD', 'DKK', 'PLN', 'THB', 'IDR', 'HUF', 'CZK', 'ILS', 'MYR', 'PHP', 'PKR', 'CLP', 'AED', 'SAR', 'COP', 'EGP', 'VND', 'BDT', 'KWD', 'QAR', 'UAH', 'PEN', 'MAD', 'NGN', 'KZT', 'ARS', 'DZD', 'LKR', 'OMR', 'BHD') COMMENT 'Currency type for the option price',
  created_at DATETIME COMMENT 'Timestamp when the option was created',
  created_method ENUM('manual', 'automatic') COMMENT 'Method by which the option was created',
  updated_at DATETIME COMMENT 'Timestamp when the option was last updated',
  updated_method ENUM('manual', 'automatic') COMMENT 'Method by which the option was updated',
  service_time TIME COMMENT 'Duration of the service',
  services JSON COMMENT 'List of services provided by the option'
);

CREATE TABLE promotions (
  promotion_id VARCHAR(255) PRIMARY KEY COMMENT 'Unique identifier for the promotion',
  promotion_type ENUM('single_promotion', 'percentage_promotion', 'direct_discount_promotion') COMMENT 'Type of promotion',
  promotion_value FLOAT COMMENT 'Promotion value or discount percentage',
  applied_to VARCHAR(255) COMMENT 'ID of the order to which the promotion is applied, hexadecimal string',
  amount_after_promotion FLOAT COMMENT 'Total amount after the promotion is applied'
);

CREATE TABLE reviews (
  review_id VARCHAR(255) PRIMARY KEY COMMENT 'Review ID associated with the order, hexadecimal string',
  reviewed_by VARCHAR(255) COMMENT 'ID of the user who submitted the review, hexadecimal string',
  reviewed_to VARCHAR(255) COMMENT 'ID of the user being reviewed, hexadecimal string',
  order_id VARCHAR(255) COMMENT 'ID of the associated order, hexadecimal string',
  offer_id VARCHAR(255) COMMENT 'ID of the associated service, hexadecimal string',
  review_text TEXT COMMENT 'Content of the review',
  rating INT COMMENT 'Rating given in the review'
);
