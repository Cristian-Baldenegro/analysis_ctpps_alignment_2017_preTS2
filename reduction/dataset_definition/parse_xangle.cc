#include <cstdio>
#include <cstring>
#include <cstdlib>

#include <set>
#include <map>

using namespace std;

//----------------------------------------------------------------------------------------------------

void PrintIntervals(const set<unsigned int> &s, FILE *f = stdout)
{
	fprintf(f, "[");

	bool firstInt = true;
	bool inInt = false;
	unsigned int beg=0, last=0;
	for (const auto &e : s)
	{
		if (!inInt)
		{
			beg = e;
			last = e;
			inInt = true;
			continue;
		}

		if (e != last + 1)
		{
			if (!firstInt)
				fprintf(f, ", ");
			fprintf(f, "[%u, %u]", beg, last);
			firstInt = false;

			beg = last = 0;
			inInt = false;
		}

		last = e;
	}

	if (inInt)
	{
		if (!firstInt)
			fprintf(f, ", ");
		fprintf(f, "[%u, %u]", beg, last);
	}

	fprintf(f, "]");
}

//----------------------------------------------------------------------------------------------------

void SaveJSON(const map<unsigned int, set<unsigned int>> &data, FILE *f)
{
	fprintf(f, "{\n");

	bool first = true;
	for (const auto &rp : data)
	{
		if (first)
			first = false;
		else
			fprintf(f, ",\n");

		fprintf(f, "  \"%u\": ", rp.first);

		PrintIntervals(rp.second, f);
	}

	fprintf(f, "\n}\n");
}

//----------------------------------------------------------------------------------------------------

int main()
{
	// run --> set of lumisections
	map<unsigned int, set<unsigned int>> gl_data;

	// fill --> ( xangle --> (run --> set of lumisections) )
	map<unsigned int, map< unsigned int, map<unsigned int, set<unsigned int>>>> data;

	// parse input
	FILE *f = fopen("xangle_tillTS2.csv", "r");

	while (!feof(f))
	{
		char buf[300];

		char *ret = fgets(buf, 300, f);

		if (ret == NULL)
			break;

		//printf("%s\n", buf);

		char *cell_run, *cell_ls, *cell_xangle;

		char *p = strtok(buf, ",");
		int idx = 0;
		while (p != NULL)
		{
			if (idx == 0)
				cell_run = p;
			if (idx == 1)
				cell_ls = p;
			if (idx == 6)
				cell_xangle = p;

			p = strtok(NULL, ",");
			idx++;
		}

		p = strtok(cell_run, ":");
		char *s_run = p;
		p = strtok(NULL, ":");
		char *s_fill = p;

		p = strtok(cell_ls, ":");
		char *s_ls = p;

		unsigned int run = atoi(s_run);
		unsigned int fill = atoi(s_fill);
		unsigned int xangle = atoi(cell_xangle);
		unsigned int ls = atoi(s_ls);

		//printf("%u, %u, %u\n", fill, run, xangle);

		gl_data[run].insert(ls);

		data[fill][xangle][run].insert(ls);
	}

	fclose(f);

	// print out
	for (const auto &fp : data)
	{
		printf("fill %u:\n", fp.first);

		for (const auto &xp : fp.second)
		{
			printf("  xangle %u\n", xp.first);

			for (const auto &rp : xp.second)
			{
				printf("    run %u: ", rp.first);

				PrintIntervals(rp.second);

				printf("\n");
			}
		}
	}

	// save ouput
	f = fopen("xangle.json", "w");
	SaveJSON(gl_data, f);
	fclose(f);

	for (const auto &fp : data)
	{
		for (const auto &xp : fp.second)
		{
			char buf[100];
			sprintf(buf, "per_fill/fill%u_xangle%u.json", fp.first, xp.first);
			FILE *f = fopen(buf, "w");

			SaveJSON(xp.second, f);

			fclose(f);
		}
	}

	return 0;
}
