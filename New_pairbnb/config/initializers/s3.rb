CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['Access_Key_ID'],
      :aws_secret_access_key  => ENV['Secret_Access_Key'],
      :region                 => 'ap-southeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "mandypairbnb" #name_of_bucket
end
