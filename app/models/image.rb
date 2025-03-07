class Image < ApplicationRecord
  has_one_attached :file

  validates :file, presence: true
  validate :file_must_be_jpeg

  private

  def file_must_be_jpeg
    if file.attached? && !file.content_type.in?(%w(image/jpeg image/jpg))
      errors.add(:file, 'must be a JPEG file')
    end
  end
end