=pod
multiple line command start from =pod, end at =cut
=cut

# or you can use # for single line command



# Variable
$a=123.4;
$b="12aB";
$c="abc";

print($a,"\n"); # this is also ok for only one variable
print("a: $a\n");


# variable in perl is dynamic type
$new=123;
$new="a";
print("new: $new\n");

@newList=();
@newlist=push(@newList,'1');
print "newList: @newlist\n";