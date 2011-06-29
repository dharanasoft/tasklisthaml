class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |e|
    redirect_to buckets_url, :alert=>"Sorry buddy! These are not for your eyes."
  end
end
