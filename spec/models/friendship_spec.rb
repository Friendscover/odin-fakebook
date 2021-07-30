require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:userone) { User.create(first_name: 'testo', last_name: 'kesto', email: 'testo@example.com', password: 123_456) }
  let(:usertwo) { User.create(first_name: 'two', last_name: 'two', email: 'two@example.com', password: 123_456) }

  subject do
    described_class.new(user_id: userone.id,
                        friend_id: usertwo.id,
                        accepted_request: false)
  end

  context 'when all params are given' do
    it 'is sucessfully created' do
      expect(subject).to be_valid
    end
  end

  context 'when friend_id is missing' do
    it 'is failing to create' do
      subject.friend_id = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when all param are missing' do
    it 'is failing to create' do
      expect(Friendship.new).to_not be_valid
    end
  end
end
