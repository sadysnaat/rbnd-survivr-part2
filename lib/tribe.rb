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
    immune = options[:immune] if options[:immune]
    if immune
      eliminable = @members.reject { |member| member.name == immune.name }
    else
      eliminable = @members
    end
    unfortunate_fellow = eliminable.sample
    @members.delete(unfortunate_fellow)
  end
end
