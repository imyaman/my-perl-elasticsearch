use Search::Elasticsearch;
 
# Connect to localhost:9200:
 
my $e = Search::Elasticsearch->new();
 
# Round-robin between two nodes:
 
my $e = Search::Elasticsearch->new(
  nodes => [
    'erecord.elasticlive.io:9200'
  ]
);
 
# Connect to cluster at search1:9200, sniff all nodes and round-robin between them:
 
#my $e = Search::Elasticsearch->new(
#  nodes  => 'search1:9200',
#  cxn_pool => 'Sniff'
#);

my $results = $e->search(
  index => 'logindex',
  body  => {
    query => {
      #match => { title => 'elasticsearch' }
      match => { }
    }
  }
);

print $results;
