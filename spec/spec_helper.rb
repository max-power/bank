# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/spec'
begin; require 'turn/autorun'; rescue LoadError; end

require 'active_model'
require 'bank/iban'
require 'bank/bic'
