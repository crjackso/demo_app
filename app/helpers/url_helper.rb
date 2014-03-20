module UrlHelper
  def generate_unique_url(microsite, influencer_id)
    return microsite if influencer_id.nil?

    hashids = Hashids.new("this is my salt")
    hash = hashids.encrypt(influencer_id)
    return "#{microsite}/?influencer=#{hash}"
  end
end