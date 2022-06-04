class HomesController < ApplicationController

    include ApplicationHelper
    
    def index
        login_check
    end

end
