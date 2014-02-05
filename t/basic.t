use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Capture::Tiny 0.23 qw/capture/;

for my $file (qw/fails.t dies.t/) {
    $ENV{AUTOMATED_TESTING} = 1;
    my ( $stdout, $stderr ) = capture {
        system( $^X, "examples/$file" );
    };
    like( $stderr, qr/\QListing modules from %INC/, "$file: Saw diagnostic header" );
    like( $stderr, qr/[0-9.]+\s+Path::Tiny/, "$file: Saw Path::Tiny in module list" );
    unlike( $stderr, qr/Foo/, "$file: Did not see local module Foo in module list", );
}

done_testing;
#
# This file is part of Test-DiagINC
#
# This software is Copyright (c) 2014 by David Golden.
#
# This is free software, licensed under:
#
#   The Apache License, Version 2.0, January 2004
#

# vim: ts=4 sts=4 sw=4 et:
