all: parse_xangle

parse_xangle: parse_xangle.cc
	g++ `root-config --libs` -lMinuit `root-config --cflags` --std=c++11 -Wall \
		parse_xangle.cc -o parse_xangle
