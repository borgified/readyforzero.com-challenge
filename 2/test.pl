#!/usr/bin/perl -w

open(INPUT,"input");
$string=<INPUT>;
chomp($string);

my @items=split(//,$string);

my $i=1;
my $result=0;

foreach my $item (@items){
	if($i==2){
		$i=1;
		print "----------skipped $item\n";
		next;
	}elsif($item =~ /\d/){
		$result = $item+$result;
		print "+ $item = $result\n";
	}else{
		print "ignored $item\n";
	}
	$i++;
}

print "\ntotal: $result\n";
