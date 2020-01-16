require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  # initialize test data
  let!(:categories) { create_list(:category, 5) }
  let(:category_id) { categories.first.id }

  describe 'GET /categories' do
    before { get '/categories' }

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /categories' do
    # valid payload
    let(:valid_attributes) { { name: 'Movie' } }

    context 'when the request is valid' do
      before { post '/categories', params: valid_attributes }

      it 'creates a category' do
        expect(json['name']).to eq('Movie')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/categories', params: { name: 'Movie' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(+"{\"message\":\"Validation failed: Name can't be blank\"}")
      end
    end
  end

  describe 'PUT /categories/:id' do
    let(:valid_attributes) { { name: 'Movie' } }

    context 'when the record exists' do
      before { put "/categories/#{category_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    before { delete "/categories/#{category_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
