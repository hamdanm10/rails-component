# frozen_string_literal: true

class PostCardComponent < ViewComponent::Base
  with_collection_parameter :post

  def initialize(post:, classes:)
    @post = post
    @classes = classes
  end
end
