require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should have_many(:reviews).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
