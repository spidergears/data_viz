class Api::V1::SearchController < ApplicationController
  def search
    render :json => (0..50).to_a.sort{ rand() - 0.5 } 
  end
end
