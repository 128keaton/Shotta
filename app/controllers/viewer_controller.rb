class ViewerController < ApplicationController
  include ActionView::Helpers::TagHelper
  
  def index
      @screenshot =  Screenshot.find(params[:id])
      @meta = social_meta_tags(@screenshot)
  end

  def social_meta_tags(screenshot)
    title = screenshot.created_at
    description = screenshot.image_identifier
    image = screenshot.image

    content_tag(:title, title) +
    content_tag(:meta, nil, content: title, property: 'og:title') +
    content_tag(:meta, nil, content: description, property: 'og:description') +
    content_tag(:meta, nil, content: image, property: 'og:image') +
    content_tag(:meta, nil, content: title, name: 'title') +
    content_tag(:meta, nil, content: description, name: 'description') +
    content_tag(:link, nil, href: image, rel: 'image_src').html_safe +
    content_tag(:meta, nil, content: 'summary', name: 'twitter:card') +
    content_tag(:meta, nil, content: title, name: 'twitter:title') +
    content_tag(:meta, nil, content: description, name: 'twitter:description') +
    content_tag(:meta, nil, content: image, name: 'twitter:image') +
    content_tag(:meta, nil, content: title, itemprop: 'name') +
    content_tag(:meta, nil, content: description, itemprop: 'description') +
    content_tag(:meta, nil, content: image, itemprop: 'image')
  end
end
