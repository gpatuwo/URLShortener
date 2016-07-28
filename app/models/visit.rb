class Visit < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true

  belongs_to :visitor,
    foreign_key: :user_id,
    class_name: :User,
    primary_key: :id

  belongs_to :shortened_url,
    foreign_key: :shortened_url_id,
    class_name: :ShortenedUrl,
    primary_key: :id

  def self.record_visit!(user, shortened_url)
    user_id = user.id
    shortened_url_id = shortened_url.id

    Visit.create(user_id: user_id, shortened_url_id: shortened_url_id)
  end


end
