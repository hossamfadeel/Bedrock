# Install riscv cross compiler

FROM python:3-slim-buster as riscv-builder

# May only need build-essential libgmp-dev libmpfr-dev libmpc-dev
# test that hypothesis later
RUN apt-get update && apt-get install -y autoconf automake autotools-dev curl\
	libmpc-dev libmpfr-dev libgmp-dev \
	gawk build-essential bison flex texinfo gperf\
	libtool patchutils bc zlib1g-dev device-tree-compiler\
	pkg-config libexpat-dev

# Documentation and rationale for this process in build-tools/riscv_meta.sh
RUN pwd && ls && \
	mkdir software && \
	cd software && \
	sh ../build-tools/riscv_prep.sh && \
	sh ../build-tools/riscv_meta.sh src /riscv32i && \
	ls /riscv32i/bin/riscv32-unknown-elf-gcc && \
	cd && rm -rf software && \
	rm -rf /var/lib/apt/lists/*

FROM python:3-slim-buster as basic-iverilog

RUN apt-get -y update && \
    apt-get install -y \
	iverilog \
	verilator \
	libbsd-dev \
	xc3sprog \
	build-essential \
	wget \
	iputils-ping \
	iproute2 \
	bsdmainutils \
	curl \
	gawk \
	flake8 \
	numpy \
	scipy \
	matplotlib && \
    rm -rf /var/lib/apt/lists/*

FROM basic-iverilog as litex

ENV LITEX_VERSION=master
ENV LITEX_ROOT_URL="http://github.com/yetifrisstlama/"
RUN mkdir litex_setup_dir && \
	cd litex_setup_dir && \
	wget https://raw.githubusercontent.com/yetifrisstlama/litex/${LITEX_VERSION}/litex_setup.py && \
	python litex_setup.py init install && \
	ln -s /non-free/Xilinx /opt/Xilinx

COPY --from=riscv-builder /riscv32i /riscv32i

ENV PATH="/riscv32i/bin:${PATH}"

RUN pip install git+https://github.com/m-labs/nmigen.git

FROM litex as testing_base

RUN apt-get -y update && \
	apt-get install -y \
	cmake \
	libftdi1-dev \
	libusb-dev \
	pkg-config && \
	rm -rf /var/lib/apt/lists/*

# Must follow iverilog installation
RUN git clone https://github.com/ldoolitt/vhd2vl && \
    cd vhd2vl && \
    git checkout 37e3143395ce4e7d2f2e301e12a538caf52b983c && \
    make && \
    install src/vhd2vl /usr/local/bin && \
    cd .. && \
    rm -rf vhd2vl
