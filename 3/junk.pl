#!/usr/bin/perl -w

open(INPUT,"input");
my $string=<INPUT>;
chomp($string);

my @numbers=split(//,$string);

my $numbers_length=@numbers;

my $min_items_subseq=2;
my $max_items_subseq=$numbers_length/2;

for($i=$min_items_subseq;$i<$max_items_subseq;$i++){ #test every possible length of subsequences

	if($numbers_length % $i != 0){
		next;
	}
#add up first sequence
	my $count=0;
	my($total1,$total2)=0; 
	while($count<$i){
		$total1 += $numbers[$count];
		$count++;
	}

#add up 2nd sequence
	$count=0;
	while($count<$i){
		$total2 += $numbers[$i+$count];
		$count++;
	}

	if($total1 == $total2){
		print "$i\n";
	}
}
