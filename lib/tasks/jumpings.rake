namespace :jumpings do
  require 'spreadsheet'

  desc 'Populate jumpings from db/jumpings.xls'
  task :populate => :environment do
    file = Rails.root.join('db', 'jumpings.xls')
    if File.exists?(file)
      book = Spreadsheet.open(file)
      sheet = book.worksheet 0

      CONN = ActiveRecord::Base.connection
      puts 'Populating jumpings...'
      data = []
      puts DateTime.now.to_s
      sheet.each_with_index do |row, i|
        break unless row[0]
        data.push %Q{('#{row[0]}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', "#{row[5]}", "#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}", "#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}")}
        print '.' if (i % 1 == 0)
      end
      data.each_slice(1) do |slice|
        sql = "INSERT INTO jumpings (`format`, `image`, `name`, `location`, `height`, `description`, `created_at`, `updated_at`) VALUES #{ slice.join(',') }"
        CONN.execute(sql)
        print '.'
      end
      puts ''
      puts "#{Jumping.count} jumpings have been added"
      puts DateTime.now.to_s
    else
      puts "#{file_path} is missing"
    end
  end
end
