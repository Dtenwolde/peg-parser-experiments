DUCKDB_PREFIX=/Users/dljtw/git/duckdb/

.PHONY: all build peglint test test_pgq clean

all: build

# Ensure peglint is executed before running the tests
build: peglint test_yacc.cpp test_peg.cpp peglib.h
	g++ test_peg.cpp -I. -std=c++17 -o test_peg -O3 -Wall
	g++ -I${DUCKDB_PREFIX}third_party/libpg_query/include/ -I${DUCKDB_PREFIX}src/include/ test_yacc.cpp ${DUCKDB_PREFIX}build/release/third_party/libpg_query/libduckdb_pg_query.a -I. -std=c++17 -o test_yacc -O3 -Wall

# Force peglint to run every time by marking it as a phony target
peglint: peglint.cc
	g++ peglint.cc -I. -std=c++17 -o peglint -O3 -Wall
	./peglint sql-with-match.gram

test: build
	./test_peg sql.gram all.sql 10
	./test_yacc all.sql 10

test_pgq: build
	./test_peg sql-with-match.gram pgq.sql 1

clean:
	rm -rf test_peg test_yacc peglint