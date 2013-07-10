require "hahashie/version"
require 'active_support/dependencies/autoload'

module Hahashie
  extend ActiveSupport::Autoload

  autoload :Mash
  autoload :Dash
  autoload :Trash
end
