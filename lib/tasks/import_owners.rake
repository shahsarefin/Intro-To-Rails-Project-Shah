require 'smarter_csv'

namespace :import do
  desc "Import owners from CSV"
  task owners: :environment do
    csv_path = Rails.root.join('db', 'owners.csv')
    options = {}
    
    SmarterCSV.process(csv_path, options) do |chunk|
        chunk.each do |data_hash|
            owner = Owner.new(data_hash)
            unless owner.save
              puts "Validation failed for #{owner.email}: #{owner.errors.full_messages.join(', ')}"
            end
          end  
    end        
    
    puts "Owners imported successfully!"
  end
end
