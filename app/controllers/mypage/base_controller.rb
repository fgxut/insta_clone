# frozen_string_literal: true

class Mypage::BaseController < ApplicationController
  before_action :require_login
  layout 'mypage'
end
