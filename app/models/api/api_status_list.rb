module Api
  module ApiStatusList 
    OK = { 'status' => 'OK', 'message' => 'success'}
    UNKNOWN_ERROR = { 'status' => 'UNKNOWN_ERROR', 'message' => 'An error occurred. Please retry.'}
    ZERO_RESULTS = { 'status' => 'ZERO_RESULTS', 'message' => 'No matching results were found'}
    OVER_QUERY_LIMIT = { 'status' => 'OVER_QUERY_LIMIT', 'message' => 'You have exhausted your api quota'}
    REQUEST_DENIED = { 'status' => 'REQUEST_DENIED', 'message' => 'You are not authorised to make this request.'}
    INVALID_REQUEST = { 'status' => 'INVALID_REQUEST', 'message' => 'The request you sent is invalid'}
    NOT_FOUND = { 'status' => 'NOT_FOUND', 'message' => 'The requested resource could not be found.'}
    INACTIVE_LISTING = { 'status' => 'INACTIVE_LISTING', 'message' => 'The requested listing has expired'}
    INVALID_CAPTCHA = { 'status' => 'INVALID_CAPTCHA', 'message' => 'Captcha validation failed.'}
    INVALID_API_KEY = { 'status' => 'INVALID_API_KEY', 'message' => 'Your API key is invalid.'}
    USER_NOT_FOUND = { 'status' => 'USER_NOT_FOUND', 'message' => 'Your EMAIL or Password is invalid.'}
    ALREADY_EXIST = { 'status' => 'MOBILE ALREADY EXIST', 'message' => 'Your mobile is already registered with other user.'}
    USER_ALREADY_EXIST = { 'status' => 'USER ALREADY EXIST', 'message' => 'Your email is already registered with other user.'}
    STORE_ALREADY_EXIST = { 'status' => 'STORE ALREADY EXIST', 'message' => 'This store is already registered by other user.'}
    ALREADY_REGISTERED = { 'status' => 'YOUR MOBILE ALREADY REGISTERED', 'message' => 'Your mobile is already registered with us.'}
    NOT_ACTIVE = { 'status' => 'NOT ACTIVE', 'message' => 'Your account is not active with us'}
    INVALID_PIN = {'status' => 'PIN ERROR', 'message' => 'You have entered wrong pin no'}
    DVAULT_ACTIVE = {'status' => 'ALREADY ACTIVATED', 'message' => 'You have already activated dvault'}
    INCORRECT_PASSWORD = {'status' => 'INCORRECT PASSWORD', 'message' => 'Incorrect password'}
    INVALID_COUPON = { 'status' => 'INVALID_COUPON', 'message' => 'Coupon validation failed.'}
    COUPON_APPLIED = { 'status' => 'COUPON_APPLIED', 'message' => 'Coupon already applied.'}
    COUPON_NOT_APPLIED = { 'status' => 'COUPON_NOT_APPLIED', 'message' => 'Coupon not applied.'}
  end
end