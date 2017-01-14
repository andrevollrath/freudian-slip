require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
  require 'pry'
  require 'freudian_slip'

  def reload!
    # Change 'gem_name' here too:
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/freudian_slip\// }
    files.each { |file| load file }
  end

  def doc!
    doc = FreudianSlip::Scraper.scrape_counselors
  end

  ARGV.clear
  Pry.start
end
