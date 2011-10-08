class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :put_admin_into_model

 # below line is used only for production mode
 #include 'ActionView::Helpers::RawOutputHelper'

def fading_flash_message(text, seconds=3)
  raw text +
    <<-EOJS
      <script type='text/javascript'>
        Event.observe(window, 'load',function() {
          setTimeout(function() {
            message_id = $('notice') ? 'notice' : 'warning';
            new Effect.Fade(message_id);
          }, #{seconds*1000});
        }, false);
      </script>
    EOJS
end

  def put_admin_into_model
    if current_admin_user
      AdminUser.current_user = current_admin_user
    end
  end

end

