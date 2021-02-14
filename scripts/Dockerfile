FROM unsat/serval-tools:latest

ARG LEAN_VERSION=v3.26.0

# Install some dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libgmp-dev \
    python3-pandas \
 && rm -rf /var/lib/apt/lists/*

# Install Lean for proof checking
RUN git clone 'https://github.com/leanprover-community/lean' && \
    cd lean && \
    git checkout ${LEAN_VERSION} && \
    mkdir -p build/release && \
    cd build/release && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local ../../src && \
    make -j4 && make install && \
    cd ../../../ && rm -rf lean

# Install tokei for LOC counting
RUN wget 'https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz' && \
    tar -xzvf tokei*.gz && \
    rm -f tokei*.gz && \
    mv tokei /usr/bin

# Add Jitterbug sources
ADD . /jitterbug
WORKDIR /jitterbug

# Install the version of Serval packaged with Jitterbug
RUN raco pkg install ./serval

ENV BOOLECTOR=/opt/boolector/3.2.1-cadical/bin/boolector
ENV Z3=/opt/z3/4.8.7/bin/z3
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib64"
