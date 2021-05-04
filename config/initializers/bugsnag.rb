if ENV['BUGSNAG_API_KEY']
  require 'bugsnag'

  Bugsnag.configure do |config|
    config.api_key = ENV['BUGSNAG_API_KEY']
    config.app_version = ENV['HEROKU_RELEASE_VERSION'] || ENV['RELEASE']
    config.notify_release_stages = ['production', 'staging']
    config.release_stage = ENV['RELEASE_STAGE'] || 'development'

    config.meta_data_filters += ['card_number', 'card_code', 'cardNumber', 'cardCode', 'cvc']
    #
    # config.ignore_classes.merge([
    #   AbstractController::ActionNotFound,
    #   ActionController::InvalidAuthenticityToken,
    #   ActionController::ParameterMissing,
    #   # ActionController::UnknownAction,
    #   ActionController::UnknownFormat,
    #   ActionController::UnknownHttpMethod,
    #   ActiveRecord::RecordNotFound,
    #   ActionController::RoutingError,
    #   ActionController::BadRequest,
    #   # CGI::Session::CookieStore::TamperedWithCookie,
    #   # Mongoid::Errors::DocumentNotFound,
    #   SignalException,
    #   SystemExit,
    # ])
  end

end
