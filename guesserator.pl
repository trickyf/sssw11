#!/usr/bin/perl
%predicate = ();
while(<>){
 $line = $_;
 @triple = split(/\s/, $line);
 $p = $triple[1];
 $predicate{$p}++; 
}
while ( my ($p, $count) = each(%predicate) ) {
 print "$p $count\n";
}
