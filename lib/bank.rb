require 'bank/version'
require 'pathname'
require 'yaml'

module Bank
  def self.load_specifications(name)
    filename = 'data' + "#{name}.yml"
    YAML.load_file Pathname.new(__FILE__).dirname.parent + filename
  end
end
