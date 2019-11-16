# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end
end
