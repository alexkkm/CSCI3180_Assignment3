use strict;
use warnings;

package Tournament;
use base_version::Team;
use base_version::Fighter;

sub new{
    my $class=shift;
    my $self={
        _team1=>shift,
        _team2=>shift,
        _roundCnt=>shift,
    }
    bless $self, $class;
    return $self;
}

sub set_teams{
    $self=shift;
    $team1=shift;
    $team2=shift;
    $self->{_team1}=$team1;
    $self->{_team2}=$team2;
}

sub play_one_round{
    $fightCnt=1;
    print("Round ",$self->{_roundCnt});
    while(1){
        $team1Fighter=$self->{$team1}->get_next_fighter();
        $team2Fighter=$self->{$team2}->get_next_fighter();

        if((!$team1Fighter)||(!$team2Fighter)){
            break;
        }

        $fighterFirst=$team1Fighter;
        $fighterSecond=$team2Fighter;
        if($team1Fighter->properties["speed"]<$team2Fighter->properties["speed"]){
            $fighterFirst=$team2Fighter;
            $fighterSecond=$team1Fighter;
        }

        $propertiesFirst=$fighterFirst->properties;
        $propertiesSecond=$fighterSecond->properties;

        $damageFirst=max($propertiesFirst["attack"]-$propertiesSecond["defense"],1);
        $fighterSecond->reduce_HP($damageFirst);

        $damageSecond="";
        if(!$fighterSecond->check_defeated()){
            $damageSecond=max($propertiesSecond["attack"]-$propertiesFirst["defense"],1);
            $fighterFirst->reduce_HP($damageSecond);
        }

        $winner_info="tie";
        if(!$damageSecond){
            $winner_info="Fighter".$fighterFirst->properties["NO"]."wins";
        }else
        {
            if($damageFirst>$damageSecond){
                $winner_info="Fighter".$fighterFirst->properties["NO"]."wins";
            }else if($damageSecond>$damageFirst){
                $winner_info="Fighter".$fighterSecond->properties["NO"]."wins";
            }
        }

        print("Duel ",$fightCnt,": Fighter ",$team1Fighter->properties["NO"]," VS Fighter ",$team2Fighter->properties["NO"]," ",$winner_info);
        $team1Fighter->print_info();
        $team2Fighter->print_info();
        $fightCnt+=1;
    }

    print("Fighters at rest:")
    $team=$self->{$team1};
        $teamFighter=$team1Fighter;
        while(1){
            if($teamFighter){
                $teamFighter->print_info();
            }else{
                break;
            }
            $teamFighter=$team->get_next_fighter();
        }
    $team=$self->{$team2};
        $teamFighter=$team2Fighter;
        while(1){
            if($teamFighter){
                $teamFighter->print_info();
            }else{
                break;
            }
            $teamFighter=$team->get_next_fighter();
        }
    $self->{_roundCnt}+=1;
}

sub check_winner(){
    $self=shift;

    $team1Defeated=1;
    $team2Defeated=1;

    @fighterList1=$self->{_team1}->{_fighterList};
    @fighterList2=$self->{_team2}->{_fighterList};

    for($i=0;i<scalar(@fighterList1);i++){
        if(!($fighterList1[i]->check_defeated())){
            $team1Defeated=0;
            break;
        }
    }

    for($i=0;i<scalar(@fighterList2);i++){
        if(!($fighterList2[i]->check_defeated())){
            $team2Defeated=0;
            break;
        }
    }

    $stop=0;
    $winner=0;
    if($team1Defeated){
        $stop=1;
        winner=2;
        $stop=1;
    }
    if($team2Defeated){
        winner=1;
        $stop=1;
    }
    return $stop,$winner;
}

sub input_fighters{
    $self.shift;
    $team_NO=shift;

    print "Please input properties for fighters in Team $team_NO";
    @fighterListTeam=();
    for ($fightIDX=(4*($team_NO-1))+1;$fightIDX<(4*($team_NO-1)+5;$fightIDX++){
        while(1){
            $input=<>;
            @properties=split(/ /,$input);
            $HP=$properties[0];
            $attack=$properties[1];
            $defense=$properties[2];
            $speed=$properties[3];
            if($HP+10*($attack+$defense+$speed)<=500){
                $fighter= new Fighter($fightIDX,$HP,$attack,$defense,$speed);
                @fighterListTeam.push($fighter);
                break;
            }
            print("Properties violate the constraint");
        }  
    }
    return @fighterListTeam;
}

sub play_game{
    $self=shift;
    $fighter_list_team1=$self->input_fighters(1);
    $fighter_list_team2=$self->input_fighters(2);

    $team1= new Team(1);
    $team2= new Team(2);
    $team1->@fighterList=$fighter_list_team1;
    $team2->@fighterList=$fighter_list_team2;

    $self->set_teams($team1,$team2);

    print("===========")
    print("Game Begins")
    print("===========\n")
    
    while(1){
        print("Team 1: please input order")
        while(1){
            $input=<>;
            @order1=split(/ /,$input);
            $flag_valid=1;
            $undefeated_number=0;
            for($i=0;$i<scalar(@order1);$i++){
                $order=$order1[$i];
                if(($order!=1)or($order!=2)or($order!=3)or($order!=4)){
                    $flag_valid=0;
                }else if($self->{$team1}->{@fighterList[$order]->check_defeated()}){
                    $flag_valid=0;
                }
            }
            for($j=0;$j<4;$j++){
                if(!$self->{$team1}->{@fighterList[$j]->check_defeated()}){
                    $undefeated_number+=1;
                }
            }
            if($undefeated_number!=scalar(@order1)){
                $flag_valid=0;
            }
            if($flag_valid){
                break;
            }else{
                print("Invalid input order");
            }
        }
        
        print("Team 2: please input order")
        while(1){
            $input=<>;
            @order2=split(/ /,$input);
            $flag_valid=1;
            $undefeated_number=0;
            for($i=0;$i<scalar(@order2);$i++){
                $order=$order2[$i];
                if(($order!=5)or($order!=6)or($order!=7)or($order!=8)){
                    $flag_valid=0;
                }else if($self->{$team2}->{@fighterList[$order]->check_defeated()}){
                    $flag_valid=0;
                }
            }
            for($j=0;$j<4;$j++){
                if(!$self->{$team2}->{@fighterList[$j]->check_defeated()}){
                    $undefeated_number+=1;
                }
            }
            if($undefeated_number!=scalar(@order2)){
                $flag_valid=0;
            }
            if($flag_valid){
                break;
            }else{
                print("Invalid input order");
            }
        }
        $self->play_one_round();
        $stop,$winner=$self->check_winner();
        if($stop){
            break;
        }
    }
    print("Team ",$winner," wins");
}
1;