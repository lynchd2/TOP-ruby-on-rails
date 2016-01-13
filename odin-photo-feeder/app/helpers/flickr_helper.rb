module FlickrHelper  
  def user_photos(user_id)
    flickr.people.getPhotos(:user_id => user_id)
  end
  
  def render_flickr_sidebar_widget(user_id)
    #begin
      photos = user_photos(user_id)
      render partial: '/layouts/sidebar_widget', locals: { photos: photos }
    #rescue Exception
      #render partial: '/layouts/unavailable'
    #end
  end
end