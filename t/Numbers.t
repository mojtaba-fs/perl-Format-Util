use strict;
use warnings;

use Test::More tests => 325;
use Test::Exception;
use Test::NoWarnings;

use Format::Util::Numbers qw(roundnear virgule to_monetary_number_format);

is(roundnear(0,    345.56789), 345.56789, 'No rounding is correct.');
is(roundnear(1,    345.56789), 346,       'Ones is correct.');
is(roundnear(0.01, 345.56789), 345.57,    'Hundredths rounding is correct.');
is(roundnear(0.02, 345.56789), 345.56,    'Two hundredths rounding is correct.');
is(roundnear(10,   345.56789), 350,       'No rounding is correct.');
is(roundnear(0,    undef),     undef,     'Rounding undef yields undef.');

is(virgule(12345.6789, 0), '12,346',      '0 decimal virgule is correct');
is(virgule(12345.6789, 1), '12,345.7',    '1 decimal virgule is correct');
is(virgule(12345.6789, 2), '12,345.68',   '2 decimal virgule is correct');
is(virgule(12345.6789, 3), '12,345.679',  '3 decimal virgule is correct');
is(virgule(12345.6789, 4), '12,345.6789', '4 decimal virgule is correct');

is(virgule('N/A',    4), 'N/A',        'Non-numeric virgule returns same');
is(virgule(.0004,    0), '0',          'Virgule does not produce -0');
is(virgule(100.34,   1), 100.3,        'Virgule fine with smaller numbers');
is(virgule(-1234.56, 3), '-1,234.560', 'Virgule on negatives is fine');
is(virgule(-1234.56, 1), '-1,234.6',   'Virgule does not round down toward zero');

is(to_monetary_number_format(undef),     '0.00',           'undef to_monetary_number_format is correct');
is(to_monetary_number_format('N/A'),     'N/A',            'nonnumeric to_monetary_number_format is correct');
is(to_monetary_number_format(123456789), '123,456,789.00', 'Integer to_monetary_number_format is correct');
is(to_monetary_number_format(123456789, 1), '123,456,789', 'Integer to_monetary_number_format is correct when requested to remove int decimals');
is(to_monetary_number_format(12345678.9), '12,345,678.90', 'One decimal to_monetary_number_format is correct');
is(to_monetary_number_format(12345678.9, 1),
    '12,345,678.90', 'One decimal to_monetary_number_format is correct when requested to remove int decimals');
is(to_monetary_number_format(1234567.89), '1,234,567.89', 'Two decimal to_monetary_number_format is correct');
is(to_monetary_number_format(123456.789), '123,456.79',   'Three to_monetary_number_format is correct');

# Now we just want to make sure that it works with all kinds of inputs, so we'll sort of fuzz test it.

foreach my $i (1 .. 100) {
    my $j = rand() * rand(100000);
    ok(roundnear(1 / $i, $j), 'roundnear runs for (' . 1 / $i . ',' . $j . ')');
    ok(virgule($j, $i), 'virgule runs for (' . $j . ',' . $i . ')');
    ok(to_monetary_number_format($j), 'to_monetary_number_format runs for (' . $j . ')');
}
