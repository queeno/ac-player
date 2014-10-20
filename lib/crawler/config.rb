require 'yaml'

module Crawler

  def self.load_config_file
    YAML.load_file('../ac-config.yml')
  end

  AC_LOGIN_URL = load_config_file['login_url']
  EMAIL = load_config_file['email']
  PASSWD = load_config_file['password']

end
