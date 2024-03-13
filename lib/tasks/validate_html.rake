# lib/tasks/validate_html.rake
require 'httparty'

namespace :validate_html do
  desc 'Validate HTML of the application pages'
  task pages: :environment do
    paths = [
      root_path,
      breeds_path,
      owners_path,
      about_path,
    ]

    paths.each do |path|
      
      url = Rails.env.development? ? "http://localhost:3000#{path}" : "https://deployment-url.com#{path}"
      
      page_html = HTTParty.get(url).body
      
      response = HTTParty.post('https://validator.w3.org/nu/?out=json',
                               headers: { 'Content-Type' => 'text/html; charset=utf-8' },
                               body: { content: page_html })
                               
      puts "Validating: #{url}"
      
      results = JSON.parse(response.body)
      
      if results['messages'].any?
        puts "Validation errors for #{url}:"
        results['messages'].each do |message|
          puts "#{message['type'].upcase}: #{message['message']}"
        end
      else
        puts "No validation errors for #{url}"
      end
    end
  end
end
