use strict;
use warnings;
use if $ENV{AUTOMATED_TESTING}, 'Test::DiagINC';
use ExtUtils::MakeMaker;
use examples::lib::Foo;

chdir ".." or die "$!"; # try to mess up relative entry in %INC

die("this fails\n");
