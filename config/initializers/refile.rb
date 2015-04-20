# config/initializers/refile.rb
require "refile/backend/s3"

aws = {
    access_key_id: "AKIAJJPBUSYJL2PLVGBQ",
    secret_access_key: "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",
    bucket: "writeit.covers.dev",
}
Refile.cache = Refile::Backend::S3.new(max_size: 100.kilobytes, prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)