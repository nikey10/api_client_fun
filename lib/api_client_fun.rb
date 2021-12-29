# frozen_string_literal: true

require 'api_client_fun/version'

require 'uri'
require 'net/http'
require 'json'

# Module represents Api Client
module ApiClientFun
  def self.profile_for_name(user_name)
    res = Net::HTTP.get_response(URI('https://blooming-savannah-20593.herokuapp.com/api/users'))

    if res.is_a?(Net::HTTPSuccess)
      body = JSON.parse(res.body)
      body['users'].each { |user| return user['profile'].transform_keys(&:to_sym) if user['name'].eql? user_name }
    end

    nil
  end
end
