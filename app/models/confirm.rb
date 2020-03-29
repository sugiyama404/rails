# frozen_string_literal: true

class Confirm < ApplicationRecord
  def self.search2(area, checkin, checkout, num)
    if checkin.present? || checkout.present?
      where(['address LIKE ?', "%#{area}%"]).where(days: checkin..checkout).or(Confirm.where(bestvacant: num..Float::INFINITY, richvacant: num..Float::INFINITY, fourthvacant: num..Float::INFINITY, doublevacant: num..Float::INFINITY)).group(:id)
    elsif area.present?
      where(['address LIKE ?', "%#{area}%"]).or(Confirm.where(bestvacant: num..Float::INFINITY, richvacant: num..Float::INFINITY, fourthvacant: num..Float::INFINITY, doublevacant: num..Float::INFINITY)).group(:id)
    else
      all.group(:id)
    end
  end
end
