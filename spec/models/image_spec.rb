# spec/models/image_spec.rb
require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image) { Image.new }

  describe 'validations' do
    context 'when file is attached' do
      it 'is valid if the file is a JPEG' do
        image.file.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.jpg')), filename: 'test.jpg', content_type: 'image/jpeg')
        expect(image).to be_valid
      end

      it 'is invalid if the file is not a JPEG' do
        image.file.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test.png')), filename: 'test.png', content_type: 'image/png')
        expect(image).not_to be_valid
        expect(image.errors[:file]).to include('must be a JPEG file')
      end
    end

    context 'when file is not attached' do
      it 'is valid' do
        expect(image).to be_valid
      end
    end
  end
end