use strict;
use warnings;
use IO::Socket::INET;

my $server_address = 'macbook_ip';  # Replace with your Macbook's IP address
my $server_port = 12345;            # Use the same port as the server

my $client = IO::Socket::INET->new(
    PeerAddr => $server_address,
    PeerPort => $server_port,
    Proto    => 'tcp'
) or die "Could not connect to server: $!";

print "Connected to $server_address:$server_port\n";

my $message = "Hello, server!";      # Message to send to the server

print $client "$message\n";

# Receive and display the server's response
my $response = <$client>;
print "Received from server: $response";

close($client);
