class Auth0Controller < ApplicationController
    def callback
        auth_info = request.env['omniauth.auth']
        session[:user_id] = auth_info['uid']
        session[:user_email] = auth_info['info']['email']
        redirect_to home_path, notice: 'Successfully logged in as an Admin!'
    end

    def failure
        redirect_to root_path, alert: 'Failed to log in.'
    end

    def logout
    # 1. Clear the local Rails session
    reset_session

    # 2. Build the Auth0 logout URL
    query_params = {
      client_id: ENV['AUTH0_CLIENT_ID'],
      returnTo: root_url # This tells Auth0 to send you back to http://localhost:3000/
    }
    
    logout_url = URI::HTTPS.build(
      host: ENV['AUTH0_DOMAIN'],
      path: '/v2/logout',
      query: query_params.to_query
    ).to_s

    # 3. Redirect to Auth0 (allow_other_host is required by Rails 7 for external links)
    redirect_to logout_url, allow_other_host: true
  end
end