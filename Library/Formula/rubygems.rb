require 'brewkit'

class Rubygems <Formula
  @url='http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz'
  @homepage='http://rubygems.org/'
  @md5='6e317335898e73beab15623cdd5f8cff'
  
  def install
    system "ruby setup.rb --prefix=#{prefix}"
  end
end
