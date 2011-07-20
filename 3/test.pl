#!/usr/bin/perl -w

open(INPUT,"input");
my $string=<INPUT>;
chomp($string);

my @numbers=split(//,$string);

my $numbers_length=@numbers;

my $min_items_subseq=2;
my $max_items_subseq=$numbers_length;


#algorithm
#1) add 1st + 2nd numbers, get total
#2) total - 3rd number (or next number) = x
# if x = 0, test next subsequence
# if x < 0, go back to #1 and add an extra number ie. 1st+2nd+3rd number
# if x > 0, subtract next number (go back to #2)


for($i=$min_items_subseq;$i<$max_items_subseq;$i++){ #test every possible starting length of subsequences

	my $total=0;
	my $sub_flag=0;

	print "length of starting sequence = $i\n";

	for($a=0;$a<$numbers_length;$a++){

		if($sub_flag){ #subtract phase
			$total -= $numbers[$a];
			print "\t- $numbers[$a] = $total\n";
		}else{
			$total += $numbers[$a];
			print "\t+ $numbers[$a] = $total\n";
		}

		if($total==0){ #subtract phase brought us back to 0, restart add phase
			print "\twoot! we got to 0, lets continue on to the next subsequence, resetting total back to ($currtotal)\n";
			$total=$currtotal;
			$sub_flag=1;
			$subsequence_counter++;
			if(($a+1)==$numbers_length){
				print "we reached the end of numbers array, making subsequences of equal sum\n";
				print "number of subsequences = $subsequence_counter\n";
				exit;
			}
		}elsif($total<0){	#failed, lets try a bigger starting sequence
			print "\tsubtracting took us to a negative total, trying a longer starting sequence\n";
			last;
		}else{
			#total>0, continue subtract phase
			#print "total still positive, try subtracting next number from total\n";
		}
		if($a==($i-1)){ #reached the end of a possible starting sequence, begin subtract phase
			$currtotal=$total;
			$sub_flag=1; 
			print "\treached end of starting seq, our current total is $currtotal\n";
			$subsequence_counter=1;
		}
	}	
}

