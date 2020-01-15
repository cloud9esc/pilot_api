require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:review) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
end
