
use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Dancer 2 session storage with MongoDB",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Dancer" => 0,
    "File::Find" => 0,
    "File::Temp" => "0.22",
    "HTTP::Date" => 0,
    "JSON" => 0,
    "LWP::UserAgent" => 0,
    "MongoDB" => 0,
    "Test::More" => 0,
    "Test::TCP" => "1.13"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-SessionFactory-MongoDB",
  "EXE_FILES" => [],
  "LICENSE" => "apache",
  "NAME" => "Dancer::SessionFactory::MongoDB",
  "PREREQ_PM" => {
    "Dancer" => "1.999999",
    "Dancer::Core::Role::SessionFactory" => 0,
    "Dancer::Core::Types" => 0,
    "MongoDB::MongoClient" => 0,
    "MongoDB::OID" => 0,
    "Moo" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



