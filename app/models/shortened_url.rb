

class ShortenedUrl < ActiveRecord::Base
  belongs_to :submitter,
    foreign_key: :user_id,
    class_name: :User,
    primary_key: :id

  has_many :visits,
    primary_key: :id,
    class_name: :Visit,
    foreign_key: :shortened_url_id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    include SecureRandom
      possible_url = SecureRandom.urlsafe_base64
      while self.exists?(short_url: possible_url)
        possible_url = SecureRandom.urlsafe_base64
      end
      possible_url

    # the ActiveRecord method .exists? basically does the same as below
    # *note about indices: rails is the only person who needs to know about the index table
      # we don't need to reference it. rails will do that when searching thru table
    # possible_url = urlsafe_base64
    # until self.all.none?{|object| object.short_url = possible_url}
    #   possible_url = urlsafe_base64
    # end
    # possible_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    user_id = user.id

    short_url = self.random_code

    ShortenedUrl.create(user_id: user_id, long_url: long_url, short_url: short_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.select(:user_id).where(["created_at <= ?", 10.minutes.ago]).distinct.count
  end

end
