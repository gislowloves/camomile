FROM gcc:13 AS builder

WORKDIR /build
COPY romashkovaya_valley.cpp .

RUN g++ -std=c++17 -o daisy romashkovaya_valley.cpp
FROM ubuntu:24.04

WORKDIR /camomile
COPY --from=builder /build/daisy .

CMD ["./daisy"]
