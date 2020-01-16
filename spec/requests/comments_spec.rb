require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let!(:review) { create(:review) }
  let!(:comments) { create_list(:comment, 20, review_id: review.id) }
  let(:review_id) { review.id }
  let(:id) { comments.first.id }

  # Test suite for GET /reviews/:review_id/comments
  describe 'GET /reviews/:review_id/comments' do
    before { get "/reviews/#{review_id}/comments" }

    context 'when review exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all review comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when review does not exist' do
      let(:review_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Review with 'id'=0\"}")
      end
    end
  end

  # Test suite for GET /reviews/:review_id/comments/:id
  describe 'GET /reviews/:review_id/comments/:id' do
    before { get "/reviews/#{review_id}/comments/#{id}" }

    context 'when review comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the comment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when review comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'POST /reviews/:review_id/comments' do
    let(:valid_attributes) { { commenter: 'Visit Narnia', content: 'hello world!' } }

    context 'when request attributes are valid' do
      before { post "/reviews/#{review_id}/comments", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/reviews/#{review_id}/comments", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match("{\"message\":\"Validation failed: Commenter can't be blank\"}")
      end
    end
  end

  describe 'PUT /reviews/:review_id/comments/:id' do
    let(:valid_attributes) { { commenter: 'Anon', content: 'The world!' } }

    before { put "/reviews/#{review_id}/comments/#{id}", params: valid_attributes }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.commenter).to match('Anon')
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  describe 'DELETE /reviews/:id' do
    before { delete "/reviews/#{review_id}/comments/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
