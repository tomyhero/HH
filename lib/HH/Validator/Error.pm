package HH::Validator::Error;
use Ze::Class;
extends 'Aplon::Error';

has 'error_message' => ( is => 'rw' , default => sub { {} } );



EOC;
