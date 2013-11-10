module Spree
  class MinicartController < StoreController

    respond_to :js, :only => [:show]


    def show
      respond_to do |format|
        format.html { render :show, layout: "minimal" }
        format.js
      end
    end

  end
end
