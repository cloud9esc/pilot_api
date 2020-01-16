require 'rails_helper'

RSpec.describe 'Reviews API', type: :request do
  # initialize test data
  let!(:category) { create(:category) }
  let!(:reviews) { create_list(:review, 10) }
  let(:category_id) { category.id }
  let(:review_id) { reviews.first.id }

  describe 'GET /reviews' do
    before { get '/reviews' }

    it 'returns reviews' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /reviews/id' do
    before { get "/reviews/#{review_id}" }

    context 'when the record exists' do
      it 'returns th review' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(review_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:review_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Review with 'id'=100\"}")
      end
    end
  end

  describe 'POST /reviews' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', author: '1' } }

    context 'when the request is valid' do
      before { post '/reviews', params: valid_attributes }

      it 'creates a review' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/reviews', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(+"{\"message\":\"Validation failed: Author can't be blank\"}")
      end
    end
  end

  describe 'PUT /reviews/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/reviews/#{review_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /reviews/:id' do
    before { delete "/reviews/#{review_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
