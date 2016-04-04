class Tribe
  attr_reader :name, :members

  def initialize(options={})
    @name = options[:name] if options[:name]
    @members = options[:members] if options[:members]
    puts "Tribe #{@name} is created with members: #{@members.join(', ')}"
  end

  def to_s
    @name
  end

  def tribal_council(options={})
    immune = options[:immune]
    @members.reject { |member| member.name == immune.name }.sample
  end
end
