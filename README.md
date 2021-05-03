# DNSSEC Filter

This project is meant to deliver an eBPF-executable that filters any DNS-responses on an incoming interface and drops them if the AD-bit is not set.

This is in no way meant as a security feature and will probably only be used for counting signed vs unsigned DNS-responses.
