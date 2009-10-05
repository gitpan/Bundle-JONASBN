package Module::Build::Bundle;

# $Id: Bundle.pm 6681 2009-10-05 08:36:32Z jonasbn $

use strict;
use warnings;
use Data::Dumper;
use base 'Module::Build';
use Module::Build::Base;
use Carp qw(croak);
use Cwd qw(getcwd);
use Tie::IxHash;

our $VERSION = '0.02';

sub ACTION_contents {
    my $self = shift;
    
    #Fetching requirements from Build.PL
    my @list = %{$self->requires()};
    
    my $sorted = 'Tie::IxHash'->new(@list);
    $sorted->SortByKey();
    
    my $pod = "=head1 CONTENTS\n\n=over\n\n";
    foreach ($sorted->Keys) {
        my ($key, $val) = $sorted->Shift();
        
        if ($val) {
            $pod .= "=item * L<$key>, $val\n\n";
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
