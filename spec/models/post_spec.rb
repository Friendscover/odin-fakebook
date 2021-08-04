require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:userone) { User.create(first_name: 'testo', last_name: 'kesto', email: 'testo@example.com', password: 123_456) }

  subject do
    described_class.new(title: 'Hello World!',
                        body: 'This is a test post for rspec!',
                        user_id: userone.id)
  end

  context 'when all params are given' do
    it 'is sucessfully created' do
      expect(subject).to be_valid
    end
  end

  context 'when title is missing' do
    it 'is failing to create' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when all param are missing' do
    it 'is failing to create' do
      expect(User.new).to_not be_valid
    end
  end

  context 'when user_id is missing' do
    it 'is failing to create' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end
