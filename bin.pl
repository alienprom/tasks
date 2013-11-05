#!/usr/bin/env perl

use open ':locale';
use Modern::Perl;
use URI::UTF8::Punycode;
use utf8;
use locale;
use lib::abs 'lib';

use Domains qw(get_domain convert_to_unicode);

my %domain_count;

while (<>) {
    chomp;
    my $domain = get_domain($_);
    $domain = lc $domain;

    $domain = convert_to_unicode($domain);
    $domain_count{$domain}++;
}

foreach my $domain ( sort { $domain_count{$b} <=> $domain_count{$a} } keys %domain_count ) {
    print $domain, "\t", $domain_count{$domain}, "\n";
}
