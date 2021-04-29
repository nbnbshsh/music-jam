unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'IDAKIA2QAUPU2HH33NUP4P',
      aws_secret_access_key: 'xn2A3teVZ2+h4irnQtFHEeyfOoS1MM1QGVkS79ou',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end