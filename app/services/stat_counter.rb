class StatCounter < ApplicationService
  def initialize(short_str)
    @short_str = short_str
  end

  def call
    Stat.select(:ip).distinct.where(url_id: url.id).count
  end

  private

  attr_reader :short_str

  def url
    Url.find_by(short_url: short_str)
  end
end
