require 'rspec'
require 'time'

require_relative '../lib/MissionControl'

<<<<<<< HEAD
describe MissionControl do
  before(:each) do
    if File.exists?("punch_card")
      FileUtils.rm("punch_card")
=======
describe MissionControlCommand do
  let(:test_file_path) do
    #output <working directory>/spec
    File.expand_path(File.dirname(__FILE__) + '/check_in')
  end

  before(:each) do
    FileUtils.rm_f(test_file_path)
  end

  after(:each) do
    FileUtils.rm_f(test_file_path)
  end

  context 'checking in' do
    it 'acknowledges my check in' do
      cmd = MissionControlCommand.new('in', test_file_path)
      expect(cmd.output).to include('You are checked in')
>>>>>>> f90f6bf740efef220ff8dce951ab44663c2a45bf
    end
  end

<<<<<<< HEAD
  it 'mission control shows us to be checked out' do
    cmd = MissionControl.new("in")
    cmd.punch
    cmd = MissionControl.new("out")
    expect(File.exists?("punch_card")).to be_true
    expect(cmd.punch).to include("Your Checked Out")
  end

  it 'mission control shows us to already be checked out' do
    cmd = MissionControl.new("out")
    expect(cmd.punch).to include("Your Already Checked Out")
=======
    it 'creates a check in file' do
      cmd = MissionControlCommand.new('in', test_file_path)
      check_in_path = cmd.class.check_in_path
      if FileTest.exists?(check_in_path)
        FileUtils.rm(check_in_path)
      end

      cmd.output
      expect(check_in_path).to be_true
    end

    it 'creates a check in file at a path I specify' do
      cmd = MissionControlCommand.new('in', test_file_path)
      if FileTest.exists?(test_file_path)
        FileUtils.rm(test_file_path)
      end
      cmd.output
      expect(FileTest.exists?(test_file_path)).to be_true
    end
>>>>>>> f90f6bf740efef220ff8dce951ab44663c2a45bf
  end

  it 'mission control creates a check in file' do
   cmd = MissionControl.new("in")
   cmd.punch
   expect(File.exists?("punch_card")).to be_true
  end

<<<<<<< HEAD
  it 'mission control checks if you have already punched in' do
    cmd = MissionControl.new("in")
    if File.exists?("punch_card")
      expect(cmd.punch).to include("Your already checked in")
    else
      expect(cmd.punch).to include("Your Checked In")
    end
=======
  it 'acknowledges my check out' do
    check_in = MissionControlCommand.new('in', test_file_path)
    check_in.output
    cmd = MissionControlCommand.new('out', test_file_path)
    expect(cmd.output).to include('You are checked out')
>>>>>>> f90f6bf740efef220ff8dce951ab44663c2a45bf
  end

  it 'mission control reads the punch_card' do
    cmd = MissionControl.new("in")
    cmd.punch
    expect(cmd.punch_reader.length).to eql(26)
  end

  it 'mission control logs time differece between punch in punch out' do
    check_in_t = '2013-05-22 21:32:52 -0400'
    check_out_time = Time.now
    check_in_time = Time.parse(check_in_t)
    time_difference = (check_out_time - check_in_time)/60

    cmd = MissionControl.new("in")
    cmd.punch(check_in_t)
    cmd = MissionControl.new("out")
    cmd.punch(check_in_t)
    expect(cmd.punch_calc(check_out_time)).to eql(time_difference)
  end

  it 'mission control returns the cleared punch card' do
    cmd = MissionControl.new("out")
    cmd.punch
    cmd.punch_out
    expect(File.exists?("punch_card")).to be_false
  end
end


