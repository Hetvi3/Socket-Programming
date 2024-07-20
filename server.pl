use strict;
use warnings;
use IO::Socket::INET;

my $host = '0.0.0.0';  # Listen on all available network interfaces
my $port = 12345;      # Choose an available port

my $server = IO::Socket::INET->new(
    LocalHost => $host,
    LocalPort => $port,
    Proto     => 'tcp',
    Listen    => 5,
    Reuse     => 1
) or die "Could not create server: $!";

print "Server is running on $host:$port\n";

while (my $client = $server->accept) {
    my $client_address = $client->peerhost();
    my $client_port = $client->peerport();

    print "Connection from: $client_address:$client_port\n";

    my $data = "Hello, client!";  # Response to the client
    print $client $data;
    close($client);
}

