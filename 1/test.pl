#!/usr/bin/perl -w

open(INPUT,"txt");
while(defined(my $line=<INPUT>)){
	chomp($line);
	my @chars=split(//,$line);
	$length=@chars;
	for($i=0;$i<$length;$i++){
		if(!defined($chars[$i+4])){
			next;
		}
		my $seq="$chars[$i]$chars[$i+1]$chars[$i+2]$chars[$i+3]$chars[$i+4]";
		#print "$seq ";
		
		if(exists($db{$seq})){
			print "\nfound one: $seq\n";
		}else{
			$db{$seq}=1;
		}
	}
}

my @keys=keys %db;
$keys_length=@keys;

my $i=0;

foreach my $key1 (@keys){
	$i++;
	print "trying to match $key1 ($i/$keys_length) with:\n";
	foreach my $key2 (@keys){
		if($key1 eq $key2){ #skip the exact matches since we're lookin for close ones
			next;
		}
		print "\b\b\b\b\b\b\b\b\b\b$key2";
		my @a=split(//,$key2);
		my $a_length=@a;
		for(my $i=0;$i<$a_length;$i++){
			if($a[$i] =~ /\W/){
				$a[$i]="\\".$a[$i];
			}
		}
		$match0=".$a[1]$a[2]$a[3]$a[4]";
		$match1="$a[0].$a[2]$a[3]$a[4]";
		$match2="$a[0]$a[1].$a[3]$a[4]";
		$match3="$a[0]$a[1]$a[2].$a[4]";
		$match4="$a[0]$a[1]$a[2]$a[3].";

		if($key1 =~ /$match0|$match1|$match2|$match3|$match4/){
			print "found close match: $key1 and $key2\n";exit;
		}
	}
	print "\n";
}
