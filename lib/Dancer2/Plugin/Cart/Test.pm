package Dancer2::Plugin::Cart::Test;
use strict;
use warnings;
use Dancer2::Plugin;

sub BEGIN{
  has 'login_third_party' => (
    is => 'ro',
    from_config => 1,
    default => sub { '' }
  );  
  plugin_keywords qw/
   get_test_products 
  /;
}

sub BUILD {
  my $self = shift;
  my $settings = $self->app->config;
}

sub get_test_products{
  my ($self, $params)  = @_;
  $self->dsl->debug("Getting something here");
  $self->dsl->debug("using my ".$self->login_third_party);
  my $ec_cart = $self->app->session->read("ec_cart");
  $ec_cart->{products} = [
    { ec_sku=>'SU01', ec_price => 5  }
  ];
  $self->app->session->write("ec_cart",$ec_cart);
  return $ec_cart->{products};
}

1;
