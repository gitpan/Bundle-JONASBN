package Module::Build::Bundle;

# $Id: Bundle.pm 6606 2009-09-28 10:33:04Z jonasbn $

use strict;
use warnings;
use Data::Dumper;
use base 'Module::Build';
use Module::Build::Base;
use Carp qw(croak);
use Cwd qw(getcwd);

our $VERSION = '0.01';

sub ACTION_contents {
    my $self = shift;
    
    #Fetching requirements from Build.PL
    my $hash_ref = $self->requires();
    
    my $pod = "=head1 CONTENTS\n\n=over\n\n";
    foreach my $key (keys %{$hash_ref}) {
        if ($hash_ref->{$key}) {
            $pod .= "=item * L<$key>, $hash_ref->{$key}\n\n";
        } else {
            $pod .= "=item * L<$key>\n\n";
        }
    }
    $pod .= "=back\n\n=head1 SEE ALSO";

    my $cwd = getcwd();

    my $file = "$cwd/lib/Bundle/JONASBN.pm";
    open(FIN, '+<', $file)
        or croak "Unable to open file: $file - $!";
        
    my $contents = join "", <FIN>;
    $contents =~ s/=head1 CONTENTS\n\n.*=head1 SEE ALSO/$pod/s;
    close(FIN);

    open(FOUT, '>', $file)
        or croak "Unable to open file: $file - $!";
    print FOUT $contents;
    close(FOUT);
}

1;
