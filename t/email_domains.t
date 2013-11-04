#!/usr/bin/env perl

use open ':locale';
use Modern::Perl;

use utf8;

use Test::More tests => 8;
use Test::File;

require_ok('../email_domains.pl');

my $mail = get_domain('er331-1@sss@ru');
is( $mail, 'invalid', 'er331-1@sss@ru is bad e-mail' );

$mail = get_domain('ast@sarar.com');
is( $mail, 'sarar.com', 'ast@sarar.com ok' );

$mail = get_domin('рег.рф');
is( $mail, 'xn--c1ad6a.xn--p1ai', 'рег.рф ok' );

my $mailidn = convert_to_unicode($mail);
is( $mailidn, 'рег.рф', 'IDN ok' );

file_exists_ok("../emails.txt", 'file with emails exists');
file_not_empty_ok("../emails");
file_readable_ok("../emails");
