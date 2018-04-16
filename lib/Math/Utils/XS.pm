package Math::Utils::XS;

use strict;
use warnings;

use XSLoader;
use parent 'Exporter';

our $VERSION = '0.000001';
XSLoader::load( __PACKAGE__, $VERSION );

our @EXPORT_OK = qw[
    fsum
];

1;

__END__

=pod

=encoding utf8

=head1 NAME

Math::Utils::XS - Gonzo rules

=head1 VERSION

Version 0.000001

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS/ATTRIBUTES

=head1 SEE ALSO

L<< https://metacpan.org/pod/Math::Utils >>

=head1 LICENSE

Copyright (C) Gonzalo Diethelm.

This library is free software; you can redistribute it and/or modify it under
the terms of the MIT license.

=head1 AUTHOR

=over 4

=item * Gonzalo Diethelm C<< gonzus AT cpan DOT org >>

=back

=head1 THANKS
