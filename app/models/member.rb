class Member
  attr_reader :name, :role, :party, :district

  def initialize(attributes = {})
    @name = attributes[:name]
    @role = attributes[:role]
    @party = attributes[:party]
    @district = attributes[:district]
  end

  def self.all_by_state(state)
    propublica.members_by_state(state).map do |raw_member|
      Member.new(raw_member)
    end
  end

  private

  def self.propublica
    PropublicaService.new
  end
end
