class Jury
  attr_reader :members
  attr_writer :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    @members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts vote
    end
    return votes
  end

  def report_votes(final_votes)
    final_votes.each do |finalist, votes|
      puts "#{finalist} got #{votes}"
    end
  end

  def announce_winner(final_votes)
    winner = final_votes.values.max
    final_votes.key(winner)
  end
end
