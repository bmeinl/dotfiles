#!/usr/bin/env perl

use strict;
use warnings;

use JSON;

$| = 1; # don't buffer stdout

# Skip the first line which contains the version header.
print scalar <STDIN>;

# The second line contains the start of the infinite array.
print scalar <STDIN>;

# Read lines forever, ignore a comma at the beginning if it exists.
while (my ($statusline) = (<STDIN> =~ /^,?(.*)/)) {
    # Decode the JSON-encoded line.
    my @blocks = @{decode_json($statusline)};

    my $xset_q = `xset -q`;

    @blocks = ({
        full_text => 'Caps: ON',
        name => 'caps'
    }, @blocks) if $xset_q =~ /Caps Lock:\s+on/;

    # Output the line as JSON.
    print encode_json(\@blocks) . ",\n";
}
