class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :post_tag, dependent: :destroy
  has_many :tags, through: :post_tag, dependent: :destroy

  validates :event_name, presence: true
  validates :event_detail, presence: true
  validates :address, presence: true

   geocoded_by :address
    after_validation :geocode

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/images.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

  def save_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << tag
    end
  end
end
