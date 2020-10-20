# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

admin_users_csv = CSV.readlines('db/initcsv/admin_users.csv')
admin_users_csv.shift
admin_users_csv.each do |row|
  AdminUser.create(email: row[1])
  AdminUser.create(encrypted_password: row[2])
  AdminUser.create(remember_created_at: row[3])
end

guests_csv = CSV.readlines('db/initcsv/guests.csv')
guests_csv.shift
guests_csv.each do |row|
  Guest.create(name: row[1])
  Guest.create(mail: row[2])
  Guest.create(password_digest: row[3])
  Guest.create(remember_token: row[4])
end

hoteldays_csv = CSV.readlines('db/initcsv/hoteldays.csv')
hoteldays_csv.shift
hoteldays_csv.each do |row|
  Hotelday.create(hotel_id: row[1])
  Hotelday.create(bestvacant: row[2])
  Hotelday.create(richvacant: row[3])
  Hotelday.create(fourthvacant: row[4])
  Hotelday.create(doublevacant: row[5])
  Hotelday.create(days: row[6])
end

hotelprices_csv = CSV.readlines('db/initcsv/hotelprices.csv')
hotelprices_csv.shift
hotelprices_csv.each do |row|
  Hotelprice.create(hotel_id: row[1])
  Hotelprice.create(bestprice: row[2])
  Hotelprice.create(richprice: row[3])
  Hotelprice.create(fourthprice: row[4])
  Hotelprice.create(doubleprice: row[5])
  Hotelprice.create(newday: row[6])
end

hotels_csv = CSV.readlines('db/initcsv/hotels.csv')
hotels_csv.shift
hotels_csv.each do |row|
  Hotel.create(name: row[1])
  Hotel.create(bestname: row[2])
  Hotel.create(richname: row[3])
  Hotel.create(fourthname: row[4])
  Hotel.create(doublename: row[5])
  Hotel.create(mails: row[6])
  Hotel.create(address: row[7])
  Hotel.create(imgname: row[8])
  Hotel.create(password: row[9])
end

items_csv = CSV.readlines('db/initcsv/items.csv')
items_csv.shift
items_csv.each do |row|
  Item.create(name: row[1])
  Item.create(price: row[2])
end

roles_csv = CSV.readlines('db/initcsv/roles.csv')
roles_csv.shift
roles_csv.each do |row|
  Role.create(name: row[1])
end

reserveds_csv = CSV.readlines('db/initcsv/reserveds.csv')
reserveds_csv.shift
reserveds_csv.each do |row|
  Reserved.create(guest_id: row[1])
  Reserved.create(hotel_id: row[2])
  Reserved.create(stayday: row[3])
  Reserved.create(room: row[4])
  Reserved.create(guestnum: row[5])
  Reserved.create(reservedday: row[6])
end

users_csv = CSV.readlines('db/initcsv/users.csv')
users_csv.shift
users_csv.each do |row|
  User.create(email: row[1])
  User.create(encrypted_password: row[2])
  User.create(reset_password_token: row[3])
  User.create(reset_password_sent_at: row[4])
  User.create(remember_created_at: row[5])
  User.create(created_at: row[6])
  User.create(updated_at: row[7])
  User.create(admin: row[8])
  User.create(role_id: row[9])
end
