class ModuleHelper

  def self.default_pages
    10
  end

  def self.file_extentions
    %w(pdf log txt db dat doc docx csv xls xlsx xsd bak back backup zip tar tar.gz cfg conf config pwd sql ini inc old passwd xml mdb)
  end

  def self.keywords
    %w(admin login user username password error)
  end

  def self.url_keywords
    %w(admin login phpmyadmin readme phpinfo config)
  end

  def self.domain_to_ip( domain )
    IPSocket::getaddress( domain )
  end

  def self.output
    @output ||= Output.new
  end

  def self.same_domain?( target, result )
    return false if result.nil?
    target.domain === result.domain
  end

  def self.subdomain?( target, result )
    if result.subdomain
      target.domain === result.domain && target.subdomain != result.subdomain
    end
  end

  def self.parse_domain( domain )
    domain = URI( URI.encode(domain) ).host
    PublicSuffix.parse( domain ) if PublicSuffix.valid?( domain )
  end

end