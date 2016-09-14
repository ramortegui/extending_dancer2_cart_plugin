package Cart;
use Dancer2;
use Dancer2::Plugin::Cart;
use Dancer2::Plugin::Cart::Test;
use Dancer2::Plugin::Cart::Test::Definitions;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

hook 'plugin.cart.products' => sub {
  get_test_products;
};

true;
