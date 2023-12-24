# frozen_string_literal: true

class SearchComponent < ViewComponent::Base
  def initialize(q:, url:)
    @q = q
    @url = url
  end
end
