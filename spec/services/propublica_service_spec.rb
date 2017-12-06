require 'rails_helper'

describe PropublicaService do
  subject { PropublicaService.new }

  context 'initialize' do
    it 'returns an instance' do
      expect(subject).to be_a(PropublicaService)
    end
  end

  context 'instance methods' do
    context '#members_by_state(state)' do
      it 'returns a collection of member info' do
        members = subject.members_by_state("CO")
        member = members.first

        expect(members.count).to eq(7)
        expect(member).to be_a(Hash)
      end
    end
  end
end
