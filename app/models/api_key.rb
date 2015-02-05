class ApiKey < ActiveRecord::Base
    #attr_accessible :access_token, :expires_at, :user_id, :active, :application
    before_create :generate_access_token
    before_create :set_expiration
    belongs_to :user

    def expired?
      DateTime.now >= self.expires_at
    end


    /#def authenticate!
      error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    end

    def current_user
      # find token. Check if valid.
      token = ApiKey.where(access_token: params[:token]).first
      if token && !token.expired?
        @current_user = User.find(token.user_id)
      else
        false
      end
    end #/

   def api_params
      params.requre(:api_key).permit(:token, :active, :user_id)
   end

    private

   def generate_access_token
     begin
        self.access_token = SecureRandom.hex
     end #while #self.class.exist?(access_token: access_token)
   end

   def set_expiration
    self.expires_at = DateTime.now+30
   end

end
