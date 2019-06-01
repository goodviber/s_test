require "simplyb/version"

module Simplyb
  project_root = File.dirname(File.absolute_path(__FILE__))
  Dir.glob(project_root + '/../lib/*') { |file| require file }
end
