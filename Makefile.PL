use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Format::Util',
    AUTHOR           => q{binary.com <rakesh@binary.com>},
    VERSION_FROM     => 'lib/Format/Util.pm',
    ABSTRACT_FROM    => 'lib/Format/Util.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0
    },
    BUILD_REQUIRES => {
        'Test::More'          => 0,
        'Test::Exception'     => 0,
        'Test::NoWarnings'    => 0,
        'Math::BigInt'        => 0,
        'Scalar::Util'        => 0,
        'POSIX'               => 0,
        'Encode'              => 0
    },
    PREREQ_PM => {
        'Test::More'          => 0,
        'Test::Exception'     => 0,
        'Test::NoWarnings'    => 0,
        'Math::BigInt'        => 0,
        'Scalar::Util'        => 0,
        'POSIX'               => 0,
        'Encode'              => 0
    },
    (! eval { ExtUtils::MakeMaker->VERSION(6.46) } ? () :
        (META_ADD => {
            resources => {
                homepage   => 'https://github.com/binary-com/perl-Format-Util',
                repository => 'git@github.com:binary-com/perl-Format-Util.git',
                bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Format-Util',
            },
        })
    ),
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Format-Util-*' },
);
