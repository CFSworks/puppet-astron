define astron::role::stateserver (
    $daemon,

    $control,
) {
    realize ::Concat::Fragment["astron-$daemon-config-roles-section"]

    ::concat::fragment { "astron-$daemon-config-stateserver-$name":
        target  => "astron-$daemon-config",
        order   => '15',
        content => "  - type: stateserver\n    control: $control\n\n",
    }
}
