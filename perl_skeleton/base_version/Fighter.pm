use strict;
use warnings;

package Fighter;


sub new{
  my $class=shift;
  my $self={
    _NO=>shift,
    _HP=>shift,
    _attack=>shift,
    _defense=>shift,
    _speed=>shift,
    _defeated=>shift,
  }
  bless $self, $class;
  return $self;
}

sub get_properties{
  my $self=shift;
  return{
    "NO": $self->{_NO},
    "HP": $self->{_HP},
    "attack": $self->{_attack},
    "defense": $self->{_defense},
    "speed": $self->{_speed},
    "defeated": $self->{_defeated}
  };
}

sub reduce_HP{
  my $self=shift;
  my $damage=shift;

  $self->{_HP}= $self->{_HP}-$damage;

  if($self->{_HP}<=0){
    $self->{_HP}=0;
    $self->{_defeated}=1; # True
  }

}

sub check_defeated{
  my $self = shift;
  return $self->{_defeated};
}

sub print_info{
  my $self = shift;
  
  my $defeated_info;
  if ($self -> check_defeated() == 1){
    $defeated_info = "defeated";
  }else{
    $defeated_info = "undefeated";
  }
  print "fighter $self->{'NO'}: HP: $self->{'HP'} attack: $self->{'attack'} defense: $self->{'defense'} speed: $self->{'speed'} $defeated_info\n";
}


1;
