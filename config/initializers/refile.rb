# config/initializers/refile.rb
require "refile/backend/s3"

aws = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_KEY'],
    bucket: ENV['S3_BUCKET'],
}
Refile.cache = Refile::Backend::S3.new(max_size: 100.kilobytes, prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)