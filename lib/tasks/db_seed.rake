namespace 'db:seed' do
  desc 'Populate the jumpings'
  task :jumpings => %w(jumpings:populate)
end
