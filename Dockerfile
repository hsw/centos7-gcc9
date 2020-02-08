FROM centos:7
ENV GCC_VERSION 9.2.0
ENV GCC_MIRRORS https://ftpmirror.gnu.org/gcc
RUN yum -y install wget bzip2 gcc gcc-c++ make && \
  mkdir -p /usr/src/gcc && cd /usr/src/gcc && \
  curl -sL $GCC_MIRRORS/gcc-$GCC_VERSION/gcc-$GCC_VERSION.tar.xz | tar --strip-components=1 -xJ && \
  ./contrib/download_prerequisites && \
  ./configure --enable-languages=c,c++ --disable-multilib && \
  make --quiet -j$(nproc) && \
  make --quiet install-strip && \
  yum -y history undo last && yum clean all && rm -rf /var/cache/yum /usr/src/gcc
