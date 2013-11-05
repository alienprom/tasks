#!/usr/bin/env perl

use open ':locale';
use Modern::Perl;
use utf8;
use FindBin qw($Bin);
use lib "$Bin/../lib";
use Domains qw(get_domain convert_to_unicode);

use Test::More tests => 8;
use Test::File;

require_ok('Domains');

my $mail = get_domain('er331-1@sss@ru');
is( $mail, 'Invalid', 'er331-1@sss@ru is bad e-mail' );

$mail = get_domain('ast@sarar.com');
is( $mail, 'sarar.com', 'ast@sarar.com ok' );

my $mailidn = convert_to_unicode('xn--c1ad6a.xn--p1ai');
is( $mailidn, 'рег.рф', 'IDN ok' );

file_exists_ok("$Bin/../emails.txt", 'file with emails exists');
file_not_empty_ok("$Bin/../emails.txt");
file_readable_ok("$Bin/../emails.txt");
