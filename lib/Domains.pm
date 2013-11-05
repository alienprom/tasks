#!/usr/bin/env perl

package Domains;
use Exporter "import";
our @EXPORT_OK = qw(get_domain convert_to_unicode);

use Modern::Perl;
use URI::UTF8::Punycode;

sub get_domain {
     my ($mail) = @_;
     if ( $mail =~ /[\w+\-\.]+\@([\w\-\.]+\.\w{2,3})/ ) {
         return $1;
     }
     else {
     return "Invalid";
     }
 }

sub convert_to_unicode {
    my ($domain) = @_;
    my @domains;
    foreach my $tld (split /\./, $domain) {
        if ($tld =~ /^xn--/) {
             $tld = puny_dec($tld);
             utf8::decode($tld);
        }
         push @domains, $tld;
     }
     return join ".", @domains;
}

1;

__END__

=encoding utf8

=head1 NAME

Domains

=head1 DESCRIPTION

Библиотека функций для извлечения  доменных имен

=head1 METHODS

=head2 get_domain

Функция возвращает имя домена из адреса электронной почты, либо 'Invalid' при некорректном e-mail.

=head2 convert_to_unicode
Конвертирует имя домена, если оно IDN.
