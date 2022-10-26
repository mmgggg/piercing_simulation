require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'piercingsimulation' # 作成したバケット名を記述
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/piercingsimulation'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキーの環境変数
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキーの環境変数
      region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
      path_style: true
    }
end

