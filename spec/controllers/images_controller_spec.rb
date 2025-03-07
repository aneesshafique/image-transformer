# spec/controllers/images_controller_spec.rb
require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:valid_attributes) { { file: fixture_file_upload('spec/fixtures/files/test.jpg', 'image/jpeg') } }
  let(:invalid_attributes) { { file: nil } }
  let(:image) { Image.create!(valid_attributes) }

  describe 'GET #new' do
    it 'assigns a new image as @image' do
      get :new
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Image' do
        expect {
          post :create, params: { image: valid_attributes }
        }.to change(Image, :count).by(1)
      end

      it 'redirects to the created image with a notice' do
        post :create, params: { image: valid_attributes }
        expect(response).to redirect_to(Image.last)
        expect(flash[:notice]).to eq('Image uploaded successfully.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new Image' do
        expect {
          post :create, params: { image: invalid_attributes }
        }.not_to change(Image, :count)
      end

      it 're-renders the :new template' do
        post :create, params: { image: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested image as @image' do
      get :show, params: { id: image.id }
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'GET #compress' do
    it 'sends compressed image data' do
      get :compress, params: { id: image.id, quality: 50 }
      expect(response.content_type).to eq('image/jpeg')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #convert_to_png' do
    it 'sends PNG image data' do
      get :convert_to_png, params: { id: image.id }
      expect(response.content_type).to eq('image/png')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #convert_to_bw' do
    it 'sends black and white image data' do
      get :convert_to_bw, params: { id: image.id }
      expect(response.content_type).to eq('image/jpeg')
      expect(response).to have_http_status(:success)
    end
  end
end