#########################################################################
#  OpenKore - Packet sending
#  This module contains functions for sending packets to the server.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
#
#  $Revision: 6687 $
#  $Id: kRO.pm 6687 2009-04-19 19:04:25Z technologyguild $
########################################################################
# Korea (kRO)
# The majority of private servers use eAthena, this is a clone of kRO

package Network::Send::kRO::Sakexe_2008_09_10a;

use strict;
use base qw(Network::Send::kRO::Sakexe_2008_08_20a);

sub version {
	return 23; # looks a lot like 25, except that 25 inherits from 24
}

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);

	my %packets = (
		'009B' => undef,
		'0190' => undef,
		'0439' => ['item_use', 'a2 v a4', [qw(ID targetID)]],#8
	);
	$self->{packet_list}{$_} = $packets{$_} for keys %packets;

	my %handlers = qw(
		actor_action 0437
		item_use 0439
		map_login 0436
		skill_use 0438
	);
	$self->{packet_lut}{$_} = $handlers{$_} for keys %handlers;

	$self;
}

1;

=pod
//2008-09-10aSakexe
packet_ver: 23
0x0436,19,wanttoconnection,2:6:10:14:18
0x0437,7,actionrequest,2:6
0x0438,10,useskilltoid,2:4:6
0x0439,8,useitem,2:4
=cut