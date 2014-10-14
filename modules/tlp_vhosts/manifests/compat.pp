
class tlp_vhosts::compat inherits tlp_vhosts {

    # Create wget and rsync symlink to the fbsd locations
    # to appease the hardcoded binary locations in the
    # scripts
    file { '/usr/local/bin/rsync':
        ensure => 'link',
        target => '/usr/bin/rsync',
    }

    file { '/usr/local/bin/wget':
        ensure => 'link',
        target => '/usr/bin/wget',
    }

    file { '/www':
        ensure => 'link',
        target => '/var/www',
    }

    $apache_org_dirs = ['/var/www', '/var/www/www.apache.org', '/var/www/www.apache.org/dist', '/var/www/www.apache.org/dist/zzz']

    file { $apache_org_dirs:
        ensure => 'directory',
        owner => 'svnwc',
        group => 'apmirror',
        mode => '2775',
    }

}
