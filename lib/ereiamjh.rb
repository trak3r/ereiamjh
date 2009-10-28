require 'rubygems'
# require 'httparty'
require 'twitter' # requires 'httparty

LAST_FILE = '.ereiamjh'

def last_msg
  File.open(LAST_FILE, 'r').read.strip if File.exists?(LAST_FILE)
end

def set_last_msg(msg)
  File.open(LAST_FILE, 'w') do |file|
    file.puts msg.strip
  end
end

class EreIAmJH
  include HTTParty
  base_uri 'ip-address.domaintools.com'

  def initialize(username, password)
    @username = username
    @password = password
  end

  # {"dnstools"=>{
  #   "city"=>"Ft. Lauderdale",
  #   "connection"=>"close",
  #   "accepted_types"=>nil,
  #   "accepted_encodings"=>nil,
  #   "protocol"=>"HTTP/1.1",
  #   "region"=>"Florida",
  #   "language"=>nil,
  #   "accepted_charsets"=>nil,
  #   "date"=>"Thu, 12 Feb 2009 20:39:56 GMT",
  #   "proxy_isp"=>nil,
  #   "unix_time"=>"1234471196",
  #   "country"=>"United States(US)",
  #   "proxy_type"=>"None / Highly Anonymous",
  #   "service_provider"=>"Domain Tools",
  #   "provider_url"=>"http://www.domaintools.com/",
  #   "proxy_region"=>nil,
  #   "isp"=>"Comcast Cable Communications Inc",
  #   "proxy_country_flag"=>nil,
  #   "user_agent"=>nil,
  #   "referer"=>nil,
  #   "hostname"=>"c-76-111-239-225.hsd1.fl.comcast.net",
  #   "remote_port"=>"55330",
  #   "keep_alive"=>nil,
  #   "blacklist_status"=>"Clear",
  #   "proxy_country"=>nil,
  #   "ip_address"=>"76.111.239.225",
  #   "country_flag"=>"http://img.domaintools.com/flags/us.gif",
  #   "proxy_city"=>nil}}

  def announce
    response = self.class.get('/myip.xml')
    dnstools = response['dnstools']
    city     = dnstools['city']
    state    = dnstools['region']
    isp      = dnstools['isp']
    ip       = dnstools['ip_address']
    location = "#{city}, #{state}"
    msg      = "Hello from #{location}!  I'm on #{isp} as #{ip}"
    unless last_msg == msg
      twitter  = Twitter::Base.new(Twitter::HTTPAuth.new(@username, @password))
      twitter.update(msg)
      twitter.update_profile(:location => location)
      set_last_msg(msg)
    end
  end
end
