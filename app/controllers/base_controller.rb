class BaseController < ApplicationController
  before_action :require_login
  layout 'mypage'
end