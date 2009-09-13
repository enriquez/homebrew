require 'brewkit'

class Rubygems <Formula
  @url='http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz'
  @homepage='http://rubygems.org/'
  @md5='6e317335898e73beab15623cdd5f8cff'
  
  def deps
    LibraryDep.new 'ruby'
  end
  
  def install
    system "#{HOMEBREW_PREFIX}/bin/ruby setup.rb"
    system "ln -s #{HOMEBREW_CELLAR}/ruby/1.8.7-p174/bin/gem #{HOMEBREW_PREFIX}/bin/gem"
  end
  
  def caveats
    <<-EOS
Set your environment variables:
export GEM_HOME="/usr/local/Cellar/ruby/1.8.7-p174/lib/ruby/gems"
export PATH="$GEM_HOME/bin:$PATH"
    EOS
  end
end
