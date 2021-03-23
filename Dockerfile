FROM centos:8.2.2004

WORKDIR /root

RUN yum -y update \
&& yum -y install gcc gcc-c++ cmake make tcl wget which perl zlib ruby-devel openssl-devel zlib-devel gdbm-devel mysql-devel pcre-devel ncurses-devel libxml2-devel readline-devel \
&& wget https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz \
&& tar xvf ruby-2.7.2.tar.gz && cd ruby-2.7.2  && ./configure && make && make install && cd .. && rm -rf ruby-2.7.2.tar.gz && rm -rf ruby-2.7.2 \
&& gem sources --remove https://rubygems.org/ -a https://gems.ruby-china.com  \
&& gem install rails -v '5.2.4' -f 