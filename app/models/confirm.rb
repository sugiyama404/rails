# frozen_string_literal: true

class Confirm < ApplicationRecord
  def self.search2(area, checkin, checkout, num)
    # nativequeryでminを出す
    # viewをデフォルトで今日の日付と明日の日付を入れる
    # 入力チェックで今日より前の日付を選択できないようにする。
    # 未選択を不可にする。

    now = Time.current
    if checkin.present? || checkout.present?
      query = 'select `id` AS `id`, `name` AS `name`, `address` AS `address`, `imgname` AS `imgname`, `bestname` AS `bestname`,' \
              ' `richname` AS `richname`, `fourthname` AS `fourthname`, `doublename` AS `doublename`, MIN(`bestvacant`) AS `bestvacant`,' \
              ' MIN(`richvacant`) AS `richvacant`, MIN(`fourthvacant`) AS `fourthvacant`, MIN(`doublevacant`) AS `doublevacant`, TRUNCATE(AVG(`bestprice`),-3) AS `bestprice`, TRUNCATE(AVG(`richprice`),-3) AS `richprice`,' \
              ' TRUNCATE(AVG(`fourthprice`),-3) AS `fourthprice`, TRUNCATE(AVG(`doubleprice`),-3) AS `doubleprice` from confirms WHERE days BETWEEN ? AND ? GROUP BY id;'
      find_by_sql([query, checkin, checkout])
    elsif area.present?
      where(['address LIKE ?', "%#{area}%"]).where(days: now).or(Confirm.where(bestvacant: num..Float::INFINITY, richvacant: num..Float::INFINITY, fourthvacant: num..Float::INFINITY, doublevacant: num..Float::INFINITY)).group(:id)
    else
      where(days: now).group(:id)
    end
  end
end
