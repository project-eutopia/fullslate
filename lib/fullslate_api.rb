require 'fullslate_api/version'
require 'yaml'

module FullslateApi
  attr_reader :config

  @config = YAML::load(File.read(File.join(ENV['HOME'], '.fullslate')))
end

require 'fullslate_api/employee'
