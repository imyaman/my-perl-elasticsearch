#!/usr/bin/env perl

use Search::Elasticsearch;
use Data::Dump qw(dump);
 
# Connect to localhost:erecord:
 
my $e = Search::Elasticsearch->new();
 
# Round-robin between two nodes:
 
my $e = Search::Elasticsearch->new(
  nodes => [
    'erecord:9200'
  ]
);

my $doc = $e->get(
  index   => 'logindex',
  type    => 'log',
  id      => 92556316 
);

dump(%$doc);
