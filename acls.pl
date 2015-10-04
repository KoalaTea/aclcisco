#!/usr/bin/perl
#meant to create commands to create acls on cisco routers

print "Would you like to include the commands to apply these to the interfaces? [y/n]";
$answer=<STDIN>;
chomp($answer);
if(lc$answer eq 'y'){
	print "Enter internal network interface. [0/1] ";
	$internal=<STDIN>;
	chomp($internal);
	if($internal='1'){
		$external='0';
	}else{
		$external='1';
	}
}
#future project
#print "What is your network ip? ";
#$netip=<>;
#chomp($netip);						#netip has an address on the subnet in decimal notation
#print "What is your netmask? ";
#$netmask=<>;
#chomp($netmask);					#netmask has the netmask in decimal notation

print "enter n for any services not being used.\n";
print "what is your ftp server ip? ";
$ftp=<>;
chomp($ftp);
print "what is your AD server ip? ";
$AD=<>;
chomp($AD);
print "what is your ssh server ip? ";
$ssh=<>;
chomp($ssh);
print "what is your web server ip? ";
$web=<>;
chomp($web);

	print"access-list 101 permit icmp any any\n";
	print"access-list 201 permit icmp any any\n";
if($ftp ne 'n'){
	print("access-list 101 permit tcp $ftp 0.0.0.0 any eq 21\n");
	print"access-list 201 permit tcp any $ftp 0.0.0.0 eq 21\n";
	print"access-list 101 permit tcp $ftp 0.0.0.0 any eq 20\n";
	print"access-list 201 permit tcp any $ftp 0.0.0.0 eq 20\n";
}
if($AD ne 'n'){
	print"access-list 201 permit udp any $AD 0.0.0.0 eq 53\n";
	print"access-list 101 permit udp $AD 0.0.0.0 any eq 53\n";
#	print"access-list 201 permit tcp any $ftp 0.0.0.0 eq 22\n";
#	print"access-list 201 permit tcp any $ftp 0.0.0.0 eq 22\n";
#	print"access-list 201 permit tcp any $ftp 0.0.0.0 eq 22\n";
}
if($ssh ne 'n'){
	print"access-list 101 permit tcp $ssh 0.0.0.0 any eq 22\n";
	print"access-list 201 permit tcp any $ssh 0.0.0.0 eq 22\n";
}
if($web ne 'n'){
	print"access-list 101 permit tcp $web 0.0.0.0 any eq 80\n";
	print"access-list 201 permit tcp any $web 0.0.0.0 eq 80\n";
	print"access-list 101 permit tcp $web 0.0.0.0 any eq 443\n";
	print"access-list 201 permit tcp any $web 0.0.0.0 eq 443\n";
}

#future project?
#if( $netip =~/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.\d({1,3})/){
#	@netips;
#	$netips[1]=$1;
#	$netips[2]=$2;
#	$netips[3]=$3;
#	$netips[4]=$4;
#	if( $netmask =~/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.\d({1,3})/){
#		$
#		while( -gt 0)
#			if($


#access-list 101 permit udp 10.122.1.1 0.0.0.0 any eq port
#	     num perm   prot	from   wildcard to	#
#access-list 101 permit icmp any any
#ip access-group [#/name] [in/out]
#apply
