# config/initializers/refile.rb
require "refile/backend/s3"

aws = {
    access_key_id: env['AWS_ACCESS_KEY_ID'],
    secret_access_key: env['AWS_SECRET_KEY'],
    bucket: env['S3_BUCKET'],
}
Refile.cache = Refile::Backend::S3.new(max_size: 100.kilobytes, prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)