require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # if Rails.env.production?
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'piercingsimulation' # 作成したバケット名を記述
  config.asset_host = 'https://piercingsimulation.s3.ap-northeast-1.amazonaws.com'
  config.fog_public = false
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキーの環境変数
    aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキーの環境変数
    region: 'ap-northeast-1',   # アジアパシフィック(東京)を選択した場合
    path_style: true
  }
  # else # 本番環境以外の場合はアプリケーション内にアップロード
  #   config.storage :file
  #   config.enable_processing = false if Rails.env.test?
  # end
end