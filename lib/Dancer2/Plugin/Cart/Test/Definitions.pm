package Dancer2::Plugin::Cart::Test::Definitions;
use Dancer2 appname =>'Cart';
hook 'plugin.cart.products' => sub {
  debug("This is on other file");
};
true;
