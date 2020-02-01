# frozen_string_literal: true

class BaseController < ApplicationController
  before_action :require_login
  layout 'mypage'
end
