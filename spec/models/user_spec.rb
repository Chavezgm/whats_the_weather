require "rails_helper"

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("mmmm@gmail.com").for(:email) }
    it { should_not allow_value("").for(:email) }
  end
end