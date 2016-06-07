#!/usr/bin/perl 

my $we = shift;
open(WE,"<$we") or die;
open(YE,">$we.Y-Error.list") or die;
my @aaa;
my %aa;
while(<WE>){
    chomp $_;
    @aaa = split(/\s+/,$_);
    if($aaa[1] eq "Y"){
        if(substr($aaa[3],0,1) eq substr($aaa[3],1,1)){
            $aa{$aaa[2]} = substr($aaa[3],1,1);
        }else{
            print YE "$aaa[0]\t$aaa[1]\t$aaa[2]\t$aaa[3]\n";
        }
    }
}
close WE;
close YE;

open(IS,"</share/huyu/wegene/my_rs/wegene/ISOGG.txt") or die;
my @bbb;
my @bb;
while(<IS>){
    chomp $_;
    @bbb = split(/\s+/,$_);
    if($aa{$bbb[1]} eq $bbb[2]){
        push(@bb,$bbb[0]);
    }
}
close IS;
