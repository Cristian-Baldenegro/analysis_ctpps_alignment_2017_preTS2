#ifndef _config_h_
#define _config_h_

#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/PythonParameterSet/interface/MakeParameterSets.h"

#include <vector>
#include <string>

using namespace std;

//----------------------------------------------------------------------------------------------------

struct Config
{
	vector<string> input_files;

	double n_si;

	double cut1_a, cut1_c, cut1_si;
	double cut2_a, cut2_c, cut2_si;
	double cut3_a, cut3_c, cut3_si;
	double cut4_a, cut4_c, cut4_si;

	bool cut1_apply;
	bool cut3_apply;

	int LoadFrom(const string &f);
};

//----------------------------------------------------------------------------------------------------

int Config::LoadFrom(const string &f_in)
{
	const edm::ParameterSet& process = edm::readPSetsFrom(f_in)->getParameter<edm::ParameterSet>("config");

	input_files = process.getParameter<vector<string>>("input_files");
	
	n_si = process.getParameter<double>("n_si");

	return 0;
}

//----------------------------------------------------------------------------------------------------

Config cfg;

#endif