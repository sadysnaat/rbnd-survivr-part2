class Tribe
  attr_reader :name, :members

  def initialize(options={})
    @name = options[:name] if options[:name]
    @members = options[:members] if options[:members]
    print_tribe
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
    puts "#{unfortunate_fellow}".red + " got eliminated."
    @members.delete(unfortunate_fellow)
  end

  def print_tribe(options={})
    table = Terminal::Table.new do |t|
      t.title = @name.light_blue
      members = @members.map do |member|
        member.to_s.green
      end
      t.add_row members
    end
    puts table
  end
end
