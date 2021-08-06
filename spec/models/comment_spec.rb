require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:userone) { User.create(first_name: 'testo', last_name: 'kesto', email: 'testo@example.com', password: 123_456) }
  let(:post) { Post.create(title: 'Hello World!', body: 'This is a test post for rspec!', user_id: userone.id) }

  subject do
    described_class.new(commenter_id: userone.id,
                        body: 'This is a comment to test rspec!',
                        post_id: post.id)
  end

  context 'when all params are given' do
    it 'is sucessfully created' do
      expect(subject).to be_valid
    end
  end

  context 'when friend_id is missing' do
    it 'is failing to create' do
      subject.commenter_id = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when all param are missing' do
    it 'is failing to create' do
      expect(Comment.new).to_not be_valid
    end
  end

  context 'when comment body length is < 10 words' do
    it 'is rejected' do
      subject.body = 'Shorty'
      expect(subject).to_not be_valid
    end
  end
end
