define astron::daemon (
    $config_path = undef,

    $ensure      = undef,

    # MD settings
    $bind        = undef,
    $connect     = undef,
    $threaded    = undef,

    # General
    $dc_files    = [],
    $eventlogger = undef,
) {
    if($config_path != undef) {
        $cfg_path = $config_path
    } else {
        $cfg_path = "/etc/astron/$name.yml"
    }

    ::concat { "astron-$name-config":
        path => $cfg_path,
    }

    ::concat::fragment { "astron-$name-config-header":
        target  => "astron-$name-config",
        order   => '00',
        content => template('astron/astrond_header.yml.erb'),
    }

    @::concat::fragment { "astron-$name-config-roles-section":
        target  => "astron-$name-config",
        order   => '10',
        content => "roles:\n",
    }

    @::concat::fragment { "astron-$name-config-uberdogs-section":
        target  => "astron-$name-config",
        order   => '20',
        content => "uberdogs:\n",
    }
}
