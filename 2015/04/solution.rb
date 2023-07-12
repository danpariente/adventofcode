# frozen_string_literal: true

require "digest"

SECRET_KEY = "iwrupvqb"
LEADING_ZEROES = "000000"

(1..Float::INFINITY).each do |decimal_number|
  md5_hash = Digest::MD5.hexdigest("#{SECRET_KEY}#{decimal_number}")

  if md5_hash.start_with?(LEADING_ZEROES)
    return puts decimal_number
  end
end
