use Search::Elasticsearch;
use Data::Dump qw(dump);

my $esclient = Search::Elasticsearch->new(
	#  nodes => 'erecord:9200'
  nodes => 'erecord:9200'
);
my $response = $esclient->search(
  index => 'logindex',
  body => {
    query => {
      match => { svcId => 'tutoring' }
    },
    aggs => {
    }
  }
);

#dump($response);

$myhits = $response->{hits}->{hits};
$myitem = $myhits->[0];
$onlydata = $myitem->{_source};
print $onlydata->{pId};
print "  ";
print $onlydata->{chId};
print "\n";




#my $response = $esclient->search(
#  index => 'logindex',
#  body => {
#    query => {
#      match => { svcId => 'tutoring' }
#    },
#    aggs => {
#      top_10_states => {
#        terms => {
#          field => 'chId',
#          size => 10
#        }
#      }
#    }
#  }
#);
