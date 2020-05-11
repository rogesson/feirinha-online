class DocumentationsController < ApplicationController
  skip_before_action :authenticate, expect: :show

  def show

  end
end