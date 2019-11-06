#!/usr/bin/env perl

use Search::Elasticsearch::Async;
use Promises backend => ['AnyEvent'];
use Data::Dump qw(dump);

my $e = Search::Elasticsearch::Async->new(
    nodes => [
        'erecord:9200',
        #'erecord:9200',
        cxn_pool => 'Async::Sniff'
    ]
);

my $results;
$e->search(
    index => 'logindex',
    body  => {
        query => {
            #match => { title => 'elasticsearch' }
            match => { serviceId => 'sangyong.gwak@devopskorea.org' }
        }
    }
)->then( sub { $results = shift; 
     print $results;
     dump(%$results);
   });

print $results;
