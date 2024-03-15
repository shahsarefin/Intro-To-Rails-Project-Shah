require 'httparty'

  class BreedsController < ApplicationController

    def index
      response = HTTParty.get('https://api.thedogapi.com/v1/breeds')
      all_breeds = response.success? ? JSON.parse(response.body) : []
      #simple search
      if params[:search].present?
        @breeds = all_breeds.select { |breed| breed['name'].downcase.include?(params[:search].downcase) }
      else
        @breeds = all_breeds
      end

       # Hierarchical search
    if params[:bred_for].present?
      all_breeds.select! { |breed| breed['bred_for']&.downcase&.include?(params[:bred_for].downcase) }
    end

    if params[:breed_group].present?
      all_breeds.select! { |breed| breed['breed_group'] == params[:breed_group] }
    end
  
      @breeds = Kaminari.paginate_array(@breeds).page(params[:page]).per(10)

    end

    def show
      response = HTTParty.get("https://api.thedogapi.com/v1/breeds/#{params[:id]}")
      @breed = response.success? ? response.parsed_response : nil
    
      if @breed
        local_breed = Breed.find_by(name: @breed['name'])
        @adoptions = local_breed ? local_breed.adoptions.includes(:owner) : []
      else
        flash[:error] = "There was a problem fetching the breed data."
        redirect_to breeds_path
      end
    end

    # app/controllers/breeds_controller.rb
class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
    @breeds = @breeds.where(breed_group: params[:breed_group]) if params[:breed_group].present?
    @breeds = @breeds.where("temperament ILIKE ?", "%#{params[:temperament]}%") if params[:temperament].present?
    @breeds = @breeds.where("weight >= ?", params[:min_weight]) if params[:min_weight].present?
    @breeds = @breeds.where("weight <= ?", params[:max_weight]) if params[:max_weight].present?
    @breeds = @breeds.where("height >= ?", params[:min_height]) if params[:min_height].present?
    @breeds = @breeds.where("height <= ?", params[:max_height]) if params[:max_height].present?
  end
end

    
  end
  
  
  
  
  
  
  