require 'rubygems'
require 'nokogiri'
require 'open-uri'

$page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def crypto_names_scrapping
  crypto_names_scrapping = $page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
  crypto_names_array = Array.new
  crypto_names_scrapping do |name|
    crypto_names_scrapping << name.text
  end
  return crypto_names_array
end

def crypto_prices_scrapping
  crypto_prices_scrapping = $page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  crypto_prices_array = Array.new
  crypto_prices_scrapping do |price|
    crypto_prices_scrapping << price.text
  end
  crypto_prices_array = crypto_prices_array.map {|price| price.delete "$" }
  return crypto_prices_array
end

def hash_names_with_prices
  result = Hash[crypto_names_array.zip(crypto_prices_array)]
  return result
end

def scrapping_result
  a = Array.new
  hash_creation.each do |name,price|
  new_hash = Hash.new
  new_hash[name] = rate
  a << new_hash
end
  p a
end

def perform
  crypto_names_scrapping
  crypto_prices_scrapping
  hash_names_with_prices
  scrapping_result
end

perform








