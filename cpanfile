requires "Carp" => "0";
requires "HTTP::Tiny" => "0";
requires "JSON::MaybeXS" => "0";
requires "Moo" => "0";
requires "Moo::Role" => "0";
requires "Safe::Isa" => "0";
requires "Search::Elasticsearch" => "2.02";
requires "Try::Tiny" => "0";
requires "perl" => "5.008";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Search::Elasticsearch::Scroll" => "0";
  requires "Test::Fatal" => "0";
  requires "Test::More" => "0";
  requires "Test::Requires" => "0";
  requires "base" => "0";
  requires "blib" => "1.01";
  requires "perl" => "5.008";
};

on 'test' => sub {
  recommends "HTTP::Tiny::Mech" => "0";
  recommends "WWW::Mechanize::Cached" => "1.48";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "HTTP::Tiny::Mech" => "0";
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "WWW::Mechanize::Cached" => "1.48";
};
