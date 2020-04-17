class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.jekyll
    where(subtitle: 'Jekyll')
  end

  scope :sass, -> { where(subtitle: 'Sass') }

  after_initialize :set_defaults

    def set_defaults
      self.main_image ||=Placeholder.image_generator(height: '600', width: '400')
      self.thumb_image ||=Placeholder.image_generator(height: '350', width: '200')
    end

end
