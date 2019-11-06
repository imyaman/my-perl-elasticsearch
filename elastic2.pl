use Search::Elasticsearch;
 
# Connect to localhost:9200:
 
my $e = Search::Elasticsearch->new();
 
# Round-robin between two nodes:
 
my $e = Search::Elasticsearch->new(
  nodes => [
    'elastic-9200.youre.space:55900'
  ]
);
 
# Connect to cluster at search1:9200, sniff all nodes and round-robin between them:
 
#my $e = Search::Elasticsearch->new(
#  nodes  => 'search1:9200',
#  cxn_pool => 'Sniff'
#);

my $results = $e->search(
  index => 'reviews',
  body  => {
    query => {
      #match => { title => 'elasticsearch' }
      match => { }
    }
  }
);

print $results;
