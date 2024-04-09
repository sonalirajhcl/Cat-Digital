require 'uri'
require 'net/http'

class CatDigital < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  after_create :notify_endpoints
  after_update :notify_endpoints

  def notify_endpoints
  	# byebug
    endpoints = Rails.application.config.webhook_endpoints
    endpoints.each do |endpoint|
    	# byebug
      uri = URI.parse(endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'

      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      request.body = { name: name, email: email }.to_json

      response = http.request(request)

      if response.is_a?(Net::HTTPSuccess)
        Rails.logger.info("Notification sent successfully to #{endpoint}")
      else
        Rails.logger.error("Failed to send notification to #{endpoint}: #{response.code} #{response.message}")
      end
    end
  end
end
