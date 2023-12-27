# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'okinawa@okinawa',
  password: 'Okinawa_base'
)

Tag.create([
  { tag_name: 'タグ1' },
  { tag_name: 'タグ2' },
  { tag_name: 'タグ3' },
  { tag_name: 'タグ4' },
  { tag_name: 'タグ5' }
])