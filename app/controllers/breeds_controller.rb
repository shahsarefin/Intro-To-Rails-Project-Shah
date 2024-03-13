require 'httparty'

  class BreedsController < ApplicationController
    def index
      response = HTTParty.get('https://api.thedogapi.com/v1/breeds')
    
      if response.success?
        all_breeds = JSON.parse(response.body)
        @breeds = Kaminari.paginate_array(all_breeds).page(params[:page]).per(15)
      else
        @breeds = Kaminari.paginate_array([]).page(params[:page]).per(15)
        flash[:error] = "There was a problem fetching the breed data."
      end
    end
  
    def show
      response = HTTParty.get('https://api.thedogapi.com/v1/breeds')
      if response.success?
        all_breeds = JSON.parse(response.body)
        @breed = all_breeds.find { |breed| breed['id'].to_s == params[:id] }
      end
    
      unless @breed
        flash[:error] = "There was a problem fetching the breed data."
        redirect_to breeds_path and return
      end

    #Assosiation with owners
    local_breed = Breed.find_by(name: @breed['name']) 
    @owners = local_breed ? local_breed.owners.distinct : []
    end
  end
  
  
  
  
  
  
  