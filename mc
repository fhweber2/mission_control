#!/usr/bin/env ruby

require_relative 'lib/MissionControl'

cmd = MissionControl.new(ARGV[0])
puts cmd.punch
