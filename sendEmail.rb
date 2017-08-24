require 'pony'
module Email
  def self.sendMail(to, subject, body)
    Pony.mail({
                  :to => to,
                  :subject => subject,
                  :body => body,
                  :via => :smtp,
                  :via_options => {
                      :address              => 'smtp.gmail.com',
                      :port                 => '587',
                      :enable_starttls_auto => true,
                      :user_name            => 'dummyd221@gmail.com',
                      :password             => 'dummyd221#123',
                      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
                      :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
                  }
              })
  end
end