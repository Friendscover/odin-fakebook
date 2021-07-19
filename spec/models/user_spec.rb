require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
         described_class.new(first_name: "testo", 
                             last_name: "kesto",
                             email: "testo@example.com",
                             password: 123456
         )  
  }

  context "when all params are given" do
    it "is sucessfully created" do
      expect(subject).to be_valid
    end
  end

  context "when email param is missing" do
    it "is failing to create" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context "when all param are missing" do
    it "is failing to create" do
      expect(User.new).to_not be_valid
    end
  end
end
