package HH::WAF::Plugin::PageCache;
use Ze::Role;
use HH::Cache::Page;
with 'Ze::WAF::Plugin::PageCache';


has '+__PageCache_cache_obj' => ( default => sub { HH::Cache::Page->instance() } );



1;
