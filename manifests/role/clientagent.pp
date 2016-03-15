define astron::role::clientagent (
    $daemon,

    $bind = undef,
    $version = undef,
    $manual_dc_hash = undef,

    $tls = false,
    $tls_certificate = undef,
    $tls_key = undef,
    # below are optional TLS settings
    $tls_chain = undef,
    $tls_authority = undef,
    $tls_verify_depth = undef,
    $tls_tlsv1 = true,
    $tls_sslv2 = false,
    $tls_sslv3 = false,

    $client_type = "libastron",
    # TODO: Should we parameterize the AstronClient's options, or allow the user to
    #       pass in a hash of values? Or maybe both?

    $tuning_interest_timeout = undef,

    $channel_min,
    $channel_max,
) {
    if $tls {
        unless $tls_certificate and $tls_key {
            fail('Missing TLS certificate and key!')
        }
        validate_bool($tls_tlsv1, $tls_sslv2, $tls_sslv3)
    }

    validate_integer($channel_min, $channel_max)

    realize ::Concat::Fragment["astron-$daemon-config-roles-section"]

    ::concat::fragment { "astron-$daemon-config-clientagent-$name":
        target  => "astron-$daemon-config",
        order   => '15',
        content => template("astron/clientagent_section.yml.erb"),
    }
}
