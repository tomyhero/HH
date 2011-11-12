package HH::Model::Base;
use Ze::Class;
extends 'Aplon';

use HH::Validator;

with 'Aplon::Validator::FormValidator::LazyWay';
has '+error_class' => ( default => 'Aplon::Error' );


sub FL_instance {
    HH::Validator->instance();
}

EOC;
