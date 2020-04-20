module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Barefoot Coder | Web Development"
    @seo_keywords = "Barefoot Coder Web Development"
  end

end
