#!/usr/bin/perl -w

use strict; 
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
use utf8;

my $ling1 = shift(@ARGV);
my $ling2 = shift(@ARGV);

my $separador = "<\/tu>" ;
$/ = $separador;

while (my $entry = <STDIN>) {
    $entry =~ s/\'($ling1)\'/\"$1\"/;
    $entry =~ s/\'($ling2)\'/\"$1\"/;
   # print STDERR "#$entry#\n";
    (my $seg1) = ($entry =~ /<tuv[^\>]*xml:lang=\"$ling1\">[\n\s\t]*([^\n]+)[\n\s\t]*<\/tuv>/);
    (my $seg2) = ($entry =~ /<tuv[^\>]*xml:lang=\"$ling2\">[\n\s\t]*([^\n]+)[\n\s\t]*<\/tuv>/);
    if (!$seg1 || !$seg2){next}
    $seg1 =~ s/^<seg>//;
    $seg1 =~ s/<\/seg>$//;
    $seg2 =~ s/^<seg>//;
    $seg2 =~ s/<\/seg>$//;
    print "$seg1\t$seg2\n";

}
