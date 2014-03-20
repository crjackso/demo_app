module UrlHelper
  def generate_unique_url(microsite, influencer_id)
    return {url: microsite} if influencer_id.nil?

    hashids = Hashids.new(ENV['HASH_SALT'])
    hash = hashids.encrypt(influencer_id)
    return {url: "#{microsite}/?influencer=#{hash}", hash: hash}
  end
end