requires 'Encode';
requires 'Math::BigInt';
requires 'POSIX';
requires 'Scalar::Util';
requires 'perl', '5.006';
requires 'File::ShareDir';
requires 'Math::BigFloat';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on test => sub {
    requires 'Test::Exception';
    requires 'Test::More';
    requires 'Test::NoWarnings';
};
