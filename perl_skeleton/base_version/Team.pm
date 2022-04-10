=pod
∗ CSCI3180 Principles of Programming Languages 
∗ 
 --- Declaration --- 
 ∗ ∗ I declare that the assignment here submitted is original except for source 
 ∗ material explicitly acknowledged. I also acknowledge that I am aware of 
 ∗ University policy and regulations on honesty in academic work, and of the 
 ∗ disciplinary guidelines and procedures applicable to breaches of such policy 
 ∗ and regulations, as contained in the website 
 ∗ http://www.cuhk.edu.hk/policy/academichonesty/ 
 ∗ ∗ Assignment 3 
 ∗ Name : Kong Kwai Man 
 ∗ Student ID : 1155125979 
 ∗ Email Addr : kmkong9@cse.cuhk.edu.hk 
=end
=cut

use strict;
use warnings;


package Team;

sub new {
    my $class=shift;
    my $NO=shift;
    my $self={
        _NO->$NO,
        _fighterList->shift,
        _order->shift,
        _fightCnt->shift,
    }

    bless $self,$class;
    return $self;
};

sub set_fighter_list{
    my $self=shift;
    my $fighterList=shift;
    $self->{_fighterList}=$fighterList;
}

sub get_fighter_list{
    my $self=shift;
    return $self->{_fighterList};
}

sub set_order{
    my $self=shift;
    my $order=shift;


}

sub get_next_fighter{
    my $self=shift;
    if(self->{_fightCnt}>=scalar self->{_order}){
        return 0;
    }
    $prevFighterIdx=self->{_order}[self->{_fightCnt}]
    $fighter=0;
    for($a=0; $a<self->{_fighterList};$a++){
        if($a->{properties}["NO"]==$prevFighterIdx){
            $fighter=$a;
            break;
        }
    }
    $self->{_fightCnt}=$self->{_fightCnt}+1;
    return $fighter;
}

1;