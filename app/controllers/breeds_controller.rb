require 'httparty'

class BreedsController < ApplicationController
    def index
      response = HTTParty.get('https://api.thedogapi.com/v1/breeds')
  
      if response.success?
        all_breeds = JSON.parse(response.body)
        # paginated the breeds with kaminari
        @breeds = Kaminari.paginate_array(all_breeds).page(params[:page]).per(15)
      else
        @breeds = Kaminari.paginate_array([]).page(params[:page]).per(15)
        flash[:error] = "There was a problem fetching the breed data."
      end
    end
  end
  