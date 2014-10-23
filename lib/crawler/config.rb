require 'yaml'

module Crawler

  CONF_FILE = File.expand_path('../../../ac-config.yml', __FILE__)

  def self.load_config_file
    YAML.load_file(CONF_FILE)
  end

  AC_LOGIN_URL = load_config_file['login_url']
  EMAIL = load_config_file['email']
  PASSWD = load_config_file['password']

end
