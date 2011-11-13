package HH::Model::Base;
use Ze::Class;
extends 'Aplon';

use HH::Validator;

with 'Aplon::Validator::FormValidator::LazyWay';
has '+error_class' => ( default => 'HH::Validator::Error' );


sub FL_instance {
    HH::Validator->instance();
}

EOC;
