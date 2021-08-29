require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:userone) { User.create(first_name: 'testo', last_name: 'kesto', email: 'testo@example.com', password: 123_456) }
  let(:usertwo) { User.create(first_name: 'two', last_name: 'two', email: 'two@example.com', password: 123_456) }
  let(:post) { Post.create(title: 'test_post', body: 'This is a test post to test like specs!', user_id: userone.id) }

  subject do
    described_class.new(post_id: post.id,
                        user_id: userone.id)
  end

  context 'when all params are given' do
    it 'is sucessfully created' do
      expect(subject).to be_valid
    end
  end

  context 'when friend_id is missing' do
    it 'is failing to create' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when all param are missing' do
    it 'is failing to create' do
      expect(Like.new).to_not be_valid
    end
  end
end
