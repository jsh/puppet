cron {"crontest":
    environment => "SHELL=/bin/bash",
    command     => '/bin/date &> /tmp/foo',
    hour        => '16',
    minute      => '34',
}
