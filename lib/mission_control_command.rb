<<<<<<< HEAD
require 'time'

class MissionControl
  attr_accessor :punch_time, :total_time
=======
require 'fileutils'

class MissionControlCommand
  def initialize(cmd, path = nil)
    @cmd = cmd
    @path = path
  end

  def object_check_in_path
    if @path.nil?
      self.class.check_in_path
    else
      @path
    end
  end
>>>>>>> f90f6bf740efef220ff8dce951ab44663c2a45bf

  def initialize(command)
    @cmd = command
    @punch_time = []
    @total_time = 0
  end

<<<<<<< HEAD
  def punch(time=Time.now)
    if @cmd == "in"
      if File.exists?("punch_card")
        "Your already checked in"
      else
        File.open("punch_card", "w+") do |i|
          i.puts time
        end
        if Time.now.min < 10
          puts "You're checked out at #{Time.now.hour}:0#{Time.now.min}"
        else
          puts "You're checked out at #{Time.now.hour}:#{Time.now.min}"
        end
      end

    elsif @cmd == "out"
      if File.exists?("punch_card") == false
        "Your Already Checked Out"
      else
        self.punch_out
        if Time.now.min < 10
          puts "You're checked out at #{Time.now.hour}:0#{Time.now.min}"
        else
          puts "You're checked out at #{Time.now.hour}:#{Time.now.min}"
        end
        "Your Checked Out"
      end
=======
  def output
    if @cmd == 'in'
      File.open(self.object_check_in_path, 'w') do |f|
        f.puts 'checkedin'
      end
      'You are checked in'
    else
      FileUtils.rm_f(self.object_check_in_path)
      'You are checked out'
>>>>>>> f90f6bf740efef220ff8dce951ab44663c2a45bf
    end
  end

  def punch_out
        self.punch_calc
        File.delete("punch_card")

  end

  def punch_reader
    File.foreach("punch_card") do |a|
      return a
    end
  end

  def punch_calc(check_out=Time.now)
    now = check_out
    earlier = Time.parse(punch_reader)
    minutes = (now - earlier)/60
    puts "You have been checked in for #{minutes.to_i} minutes"
    minutes
  end

end

#  def check_in(time=Time.now)
#
#  end
#
#  #def check_out(time=Time.now)
#end
