require 'brewkit'

class Postgresql <Formula
  @url='http://wwwmaster.postgresql.org/redir/198/h/source/v8.4.0/postgresql-8.4.0.tar.bz2'
  @homepage='http://www.postgresql.org/'
  @md5='1f172d5f60326e972837f58fa5acd130'

  def install

    configure_args = [
        "--with-bonjour",
        "--with-python",
        "--with-perl",
        "--with-gssapi",
        "--with-krb5",
        "--with-openssl",
        "--with-libxml",
        "--with-libxslt",
        "--prefix=#{prefix}",
        "--disable-debug",
        "--disable-dependency-tracking"
    ]

    system "./configure", *configure_args
    system "make install"

  end

  def caveats
    puts <<-EOS
==============================================================
Suggested next steps:

    * Create a user for postgresql (we'll name it "postgres"). 
    * Create a databse:
    
    $ sudo mkdir -p /var/db/postgresql/defaultdb
    $ sudo chown postgres /var/db/postgresql/defaultdb
    $ sudo su postgres -c '/usr/local/bin/initdb -D /var/db/postgresql/defaultdb'

    $ sudo touch /var/log/postgres.log
    $ sudo chown postgres /var/log/postgres.log

Starting:

    $ sudo su postgres -c "/usr/local/bin/pg_ctl -D /var/db/postgresql/defaultdb start -l /var/log/postgres.log"

Stopping:

    $ sudo su postgres -c "/usr/local/bin/pg_ctl -D /var/db/postgresql/defaultdb stop -s -m fast"

Google around for org.postgresql.plist if you want launchd support.
==============================================================
    EOS
  end
end
