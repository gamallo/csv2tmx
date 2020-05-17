#!/usr/bin/perl -w

use strict; 
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
use utf8;

my $ling1 = shift(@ARGV);
my $ling2 = shift(@ARGV);

print "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n";
print "<!DOCTYPE tmx SYSTEM \"tmx14.dtd\">\n";
print "<tmx version=\"1.4\">\n";
print "  <header\n";
print "    creationtool=\"csv2tmx\"\n";
print "    creationtoolversion=\"1.0\"\n";
print "    datatype=\"unknown\"\n";
print "    segtype=\"sentence\"\n";
print "    adminlang=\"en\"\n";
print "    srclang=\"en\"\n";
print "    o-tmf=\"unknown\"\/>\n";

print "  <body>\n";

my $count=1;
while (my $entry = <STDIN>) {
    if ($entry !~ /\t/) {next}
    chomp $entry;
    my ($seg1, $seg2) = split ('\t', $entry);
    
    print "    <tu tuid=\"$count\">\n";
    print "      <tuv xml:lang=\"$ling1\"><seg>$seg1<\/seg><\/tuv>\n";
    print "      <tuv xml:lang=\"$ling2\"><seg>$seg2<\/seg><\/tuv>\n";
    print "    <\/tu>\n";

    $count++;
}
print "  <\/body>\n";
print "<\/tmx>\n";
