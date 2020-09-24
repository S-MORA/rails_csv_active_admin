require 'csv'
require 'securerandom'
class CsvUpload
  class << self
    def convert_save(csv_data)
     begin
      id = SecureRandom.alphanumeric(5)
      CSV.open("#{Rails.root}/public/csv/file-#{id}.csv", "wb") do |csv|
        CSV.foreach(csv_data.path) do |row|
         csv << row
        end
       end

      rescue Exception => e
       Rails.logger.error e.message
       Rails.logger.error e.backtrace.join("\n")
       end
    end
  end
end
