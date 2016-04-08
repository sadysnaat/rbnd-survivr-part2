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
      finalist = finalists.sample
      votes[finalist] += 1
      puts "#{member} votes for #{finalist} [#{votes[finalist]}]"
    end
    return votes
  end

  def report_votes(final_votes)
    final_votes.each do |finalist, votes|
      puts "#{finalist} got #{votes} votes."
    end
  end

  def announce_winner(final_votes)
    winnin_score = final_votes.values.max
    winner = final_votes.key(winnin_score)
    puts "#{winner} has survived.🎉".light_red
    return winner
  end
end
