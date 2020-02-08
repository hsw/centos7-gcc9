FROM centos:7
RUN yum -y update && \
  yum -y install bzip2 wget gcc gcc-c++ gmp-devel mpfr-devel libmpc-devel make && \
  curl http://mirror.koddos.net/gcc/releases/gcc-9.2.0/gcc-9.2.0.tar.xz | tar -C /tmp -xJ && \
  cd /tmp/gcc-9.2.0 && \
  ./configure --enable-languages=c,c++ --disable-multilib && \
  make --quiet -j$(nproc) && \
  make --quiet install && \
  yum remove -y gcc gcc-c++ && yum clean all && rm -rf /var/cache/yum && rm -rf /tmp/gcc-9.2.0
