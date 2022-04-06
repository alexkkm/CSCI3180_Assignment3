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