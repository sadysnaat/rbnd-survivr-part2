class Game
  attr_reader :tribes

  def initialize(first_tribe, second_tribe)
    @tribes = [first_tribe, second_tribe]
  end

  def add_tribe(new_tribe)
    @tribes << new_tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(merged_tribe)
    contestants = []
    @tribes.each do |tribe|
      contestants.concat(tribe.members)
    end
    Tribe.new({name: merged_tribe, members: contestants})
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end

  def print_tribes
    @tribes.each do |tribe|
      tribe.print_tribe
    end
  end
end
