class Image
  def self.upload(filePath, filename)
    bucket = 'course'

    key = filename

    put_policy = Qiniu::Auth::PutPolicy.new(bucket, key, 3600)

    uptoken = Qiniu::Auth.generate_uptoken(put_policy)

    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
     uptoken,
     filePath,
     key,
     nil,
     bucket: bucket
     )
  end
end