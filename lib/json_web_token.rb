require 'jwt'

class JsonWebToken
    def self.encode(payload, expiration = 24.hours.from_now)
        payload = payload.dup
        payload['exp'] = expiration.to_i
        JWT.encode(payload, Rails.application.secrets.json_web_token_secret)
    end

    def self.decode(token)
        JWT.decode(token, Rails.application.secrets.json_web_token_secret).first
    rescue JWT::ExpiredSignature
        Rails.logger.info "Expired Token"
        nil
    rescue
        Rails.logger.warn "Invalid Token"
        nil
    end
end