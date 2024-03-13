# spec/features/breed_pages_validation_spec.rb
require 'rails_helper'

describe 'Breed pages HTML validation', type: :feature do
  let(:breed_ids) { Breed.pluck(:id) } # Assuming Breed is an ActiveRecord model with IDs

  it 'validates each breed page HTML through W3C Validator' do
    breed_ids.each do |id|
      visit breed_path(id) # Assuming you have a route helper breed_path
      
      page_html = page.html
      response = HTTParty.post('https://validator.w3.org/nu/?out=json',
                                body: { content: page_html },
                                headers: { 'Content-Type' => 'text/html; charset=utf-8' })

      expect(response.ok?).to be true

      validation_results = JSON.parse(response.body)
      validation_errors = validation_results['messages'].select { |msg| msg['type'] == 'error' }

      if validation_errors.any?
        puts "HTML Validation Errors for breed ID #{id}:"
        validation_errors.each do |error|
          puts error['message']
        end
      end

      expect(validation_errors).to be_empty, "HTML validation found errors for breed ID #{id}"
    end
  end
end
