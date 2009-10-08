# Build.PL for Bundle-JONASBN

# $Id: Build.PL 6721 2009-10-08 18:56:33Z jonasbn $

use strict;
use warnings;
use Module::Build::Bundle;

our $VERSION = '0.01';

my $build = Module::Build::Bundle->new(
    dist_author   => 'Jonas B. Nielsen (jonasbn), <jonasbn@cpan.org>',
    module_name   => 'Bundle::JONASBN',
    license       => 'artistic',
    create_readme => 1,
    requires      => {
        'AppConfig'                 => '0',
        'CPAN::Mini'                => '0',
        'CPAN::Reporter'            => '0',
        'Cwd'                       => '0',
        'DBD::Mock'                 => '0',
        'DBI'                       => '0',
        'Data::Dumper'              => '0',
        'Data::FormValidator'       => '0',
        'Date::Calc'                => '0',
        'DateTime'                  => '0',
        'Devel::Cover'              => '0',
        'Error'                     => '0',
        'ExtUtils::Install'         => '1.47',
        'File::Path'                => '0',
        'File::Slurp'               => '0',
        'Hash::Merge'               => '0',
        'JSON'                      => '0',
        'List::MoreUtils'           => '0',
        'Module::Build'             => '0.35',
        'Module::Info::File'        => '0',
        'Module::Load'              => '0',
        'Params::Validate'          => '0.85',
        'Perl::Tidy'                => '0',
        'Pod::Simple::Wiki'         => '0',
        'Spreadsheet::WriteExcel'   => '0',
        'Template'                  => '0',
        'Test::Exception'           => '0',
        'Test::Kwalitee'            => '0',
        'Test::MockObject::Extends' => '0',
        'Test::More'                => '0',
        'Test::Perl::Critic'        => '0',
        'Test::Pod'                 => '1.14',
        'Test::Pod::Coverage'       => '1.04',
        'Test::Prereq'              => '0',
        'Tie::IxHash'               => '0', #used in dist
        'WWW::Mechanize'            => '0',
        'WWW::Mechanize::Cached'    => '0',
        'XML::Simple'               => '0',
        'YAML'                      => '0',
    },
    meta_merge => {
        resources => {
            homepage   => 'http://logicLAB.jira.com/browse/BJONASBN',
            repository => 'http://logicLAB.jira.com/svn/BJONASBN',
        }
    },
);

$build->create_build_script();
