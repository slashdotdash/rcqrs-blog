module Admin
  class AdminController < ApplicationController
    layout 'admin'
    
    before_filter :ensure_administrator_only
    
  protected
  
    # Prevent non-administrators from accessing these actions
    def ensure_administrator_only
      # TODO
    end
  end
end