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
 
my $e = Search::Elasticsearch->new(
    nodes    => 'search1:9200',
    cxn_pool => 'Sniff'
);
 
# Index a document:
 
$e->index(
    index   => 'reviews',
    type    => 'blog_post',
    id      => 1,
    body    => {
        title   => 'Elasticsearch clients',
        content => 'Interesting content...',
        date    => '2013-09-24'
    }
);
 
# Get the document:
 
my $doc = $e->get(
    index   => 'my_app',
    type    => 'blog_post',
    id      => 1
);
 
# Search:
 
my $results = $e->search(
    index => 'my_app',
    body  => {
        query => {
            match => { title => 'elasticsearch' }
        }
    }
);
 
# Cluster requests:
 
$info        = $e->cluster->info;
$health      = $e->cluster->health;
$node_stats  = $e->cluster->node_stats;
 
# Index requests:
 
$e->indices->create(index=>'my_index');
$e->indices->delete(index=>'my_index');
