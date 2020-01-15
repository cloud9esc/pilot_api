require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:review) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:commenter) }
end
