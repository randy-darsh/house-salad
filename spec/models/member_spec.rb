require 'rails_helper'
require './app/models/member'

describe Member do
  context 'initialize' do
    it 'exists with valid data' do
      attributes = {
        name: "Dude",
        role: "Person",
        party: "Prawn",
        district: "9"
      }
      member = Member.new(attributes)
      expect(member).to be_a(Member)
      expect(member.name).to eq("Dude")
      expect(member.role).to eq("Person")
      expect(member.party).to eq("Prawn")
      expect(member.district).to eq("9")
    end
  end

  context 'class methods' do
    context ".all_by_state(state)" do
      it 'returns a list of member with a valid state' do
        VCR.use_cassette("Members.all_by_state") do
          members = Member.all_by_state("CO")
          member = members.first

          expect(members.count).to eq(7)
          expect(member).to be_a(Member)
        end
      end
    end
  end
end
