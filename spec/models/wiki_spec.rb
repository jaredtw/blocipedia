require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { User.create!(email: "user@example.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to validate_length_of(:title).is_at_least(2) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }

  describe "attributes" do
    it "has title body and user attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", user: user)
    end
  end

end
