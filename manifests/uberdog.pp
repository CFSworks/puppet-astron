define astron::uberdog (
    $daemon,

    $class     = $name,
    $id,
    $anonymous = false,
) {
    realize ::Concat::Fragment["astron-$daemon-config-uberdogs-section"]

    ::concat::fragment { "astron-$daemon-config-uberdog-$name":
        target  => "astron-$daemon-config",
        order   => '25',
        content => "  - class: $class\n    id: $id\n    anonymous: $anonymous\n\n",
    }
}
