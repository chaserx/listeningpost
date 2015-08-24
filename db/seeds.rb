seed_file = ENV['SEED_FILE'] || Rails.env
path = Rails.root.join('db', 'seeds', "#{seed_file}.rb")
if File.exist?(path)
  puts "Seeding from #{path}"
  require path
else
  puts "No seed file at #{path}"
end
