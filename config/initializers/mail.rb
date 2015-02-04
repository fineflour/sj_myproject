ActionMailer::Base.smtp_settings = {
    port:              587, 
    address:           'smtp.mailgun.org',
    #user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    #password:          ENV['MAILGUN_SMTP_PASSWORD'],
    #domain:            'appurlhere.com',
    user_name:          'postmaster',
    password:           'ConnectBfA',
    domain:             'app33089122.mailgun.org',
    authentication:    :plain,
    content_type:      'text/html'
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail 
# # only emails you.
# # http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails

class DevelopmentMailInterceptor
    def self.delivering_email(message)
     message.to =  'blocmark@app33089122.mailgun.org'
     message.cc ='fineflour@gmail.com' 
     message.bcc = nil
    end
end

# Locally, outgoing mail will be 'intercepted' by the
# # above DevelopmentMailInterceptor before going out
 if Rails.env.development?
   ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
 end
