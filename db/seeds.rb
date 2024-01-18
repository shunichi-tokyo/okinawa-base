# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_user = Admin.find_by(email: 'okinawa@okinawa')
puts "ADMIN_KEY: #{ENV['ADMIN_KEY']}"
if admin_user.nil?
  Admin.create!(
    email: 'okinawa@okinawa',
    password: ENV['ADMIN_KEY']
  )
end

# Tag.create([
#   { tag_name: 'タグ1' },
#   { tag_name: 'タグ2' },
#   { tag_name: 'タグ3' },
#   { tag_name: 'タグ4' },
#   { tag_name: 'タグ5' }
# ])

olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  user.introduction = "よろしくお願いします"

end

james = User.find_or_create_by!(email: "james@example.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
  user.introduction = "初めまして"
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
  user.introduction = "どうぞよろしく"
end

Post.find_or_create_by!(event_name: "Cavello") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.event_detail = "大人気のイベントです。"
  post.user = olivia
  post.address = "うるま市"
end

Post.find_or_create_by!(event_name: "和食屋せん") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.event_detail = "芸術は美しい！"
  post.user = james
  post.address = "那覇市"
end

Post.find_or_create_by!(event_name: "ShoreditchBar") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.event_detail = 'グルメ好きな方にオススメ！'
  post.user = lucas
  post.address = "宜野湾市"
end