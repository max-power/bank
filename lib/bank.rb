require 'bank/version'
require 'pathname'
require 'yaml'

module Bank
  def self.load_specifications(name)
    YAML.load_file Pathname.new(__FILE__).dirname.parent + 'data' + "#{name}.yml"
  end
end
