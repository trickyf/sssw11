#!/usr/bin/perl

$THRESHOLD=10;

$data = "";
%allresults = ();
$maxcount = 0;

$friendlyName = $ARGV[$0];

while(<STDIN>){
 $line = $_;
 @stats = split(/\s/, $line);
 $predicate = $stats[0];
 $count = $stats[1];
 $allresults{$predicate}=$count;
 if($count > $maxcount){
  $maxcount=$count;
 } 
}

$tholdValue = ($maxcount / 100) * $THRESHOLD;

while ( my ($p, $count) = each(%allresults) ) {
 if($count < $tholdValue){
  @tokens = split(/[\/>]/,$p);
  @reversed = reverse(@tokens);
  print "Can a $friendlyName have a $reversed[0]?\n"; 
 }
}
