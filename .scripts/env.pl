#!/usr/bin/perl

print "Content-type: text/plain\n\n";
foreach $var(keys %ENV) {
	print "<p>$var: $ENV{$var}\n";
}
