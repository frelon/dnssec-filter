GOCMD := go
CLANG := clang

GO_SOURCE := cmd/main.go
GO_BINARY := dnssec-filter

EBPF_SOURCE := bpf/xdp.c
EBPF_BINARY := bpf/xdp.elf

all: build_bpf build_go

build_bpf: $(EBPF_BINARY)

build_go: $(GO_BINARY)

clean:
	$(GOCMD) clean
	rm -f $(GO_BINARY)
	rm -f $(EBPF_BINARY)

$(EBPF_BINARY): $(EBPF_SOURCE)
	$(CLANG) -O2 -target bpf -c $^  -o $@

$(GO_BINARY): $(GO_SOURCE)
	$(GOCMD) build -o $@ $(GO_SOURCE) 

