class CsvImporterWorker
  require 'open-uri'
  require 'csv'

  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(csv_url)
    downloaded_csv = URI.open(csv_url)
    csv = CSV.parse(downloaded_csv, :headers=>true)

    ActiveRecord::Base.transaction do
      csv.each do |row|
        Note.create(name: row['new_cases']) if row['new_cases']
      end
    end
  end
end
