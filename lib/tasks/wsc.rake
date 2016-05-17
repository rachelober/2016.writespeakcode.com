require 'csv'
require 'yaml'

namespace :wsc do
  desc "convert a csv file to a temp yaml file"
  task :csv_to_json, [:csv_filename] do |t, args|
    puts args[:csv_filename]

    data = CSV.read(args[:csv_filename], :headers => true).map(&:to_hash)
    data.map! do |d|
      d["id"] = d["slug"].hash;
      d
    end

    File.open(Rails.root.join("tmp", "csv_temp.json"), 'w') { |f| f.write(data.to_json) }
  end

  task :hello do |t, args|
    puts "hello"
  end
end
