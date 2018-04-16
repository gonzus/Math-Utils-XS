use strict;
use warnings;

use Data::Dumper;
use Test::More;
use JSON::XS;
use Math::Utils::XS q(:utility);

sub test_sum {
    my @cases = (
        [ [1.0, 2, 3.0], 6 ],
        [ [1.0, [ 2, 3], 4], 10 ],
        [ [1, 0, 2, 0.0, [0, 3, 0.0]], 6 ],
        [ [10000.0, 3.14159, 2.71828], 10005.85987],
        [ [1, 1e50, 1, -1e50], 2 ],
    );
    my $json = JSON::XS->new->ascii;
    foreach my $case (@cases) {
        my $args = $case->[0];
        my $expected = $case->[1] // 0;
        my $sum;
        my $args_xs = $json->encode($args);

        $sum = fsum($args);
        is($sum, $expected, "sum of $args_xs (arrayref) adds up to $expected");

        $sum = fsum(@$args);
        is($sum, $expected, "sum of $args_xs (expanded) adds up to $expected");
        next;

        my $foo = 0.0;
        foreach my $v (@$args) {
            $foo += $v;
        }
        my $got = int(($sum + 0.05) * 100.0) / 100.0;
        my $exp = int(($foo + 0.05) * 100.0) / 100.0;
        is($got, $exp, "$got == $exp");
    }
}

sub main {
    test_sum();
    done_testing;
    return 0;
}

exit main();
