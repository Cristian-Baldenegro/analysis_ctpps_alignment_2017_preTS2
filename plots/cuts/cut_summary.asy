import root;
import pad_layout;

string topDir = "../../";

//string sample = "SingleMuon";
//string sample = "ZeroBias";
string sample = "DoubleEG";

string datasets[] = {
	"data/phys/fill_5950/xangle_120/" + sample,
	"data/phys/fill_6044/xangle_120/" + sample,
	"data/phys/fill_6061/xangle_120/" + sample,
	"data/phys/fill_6097/xangle_120/" + sample,
	"data/phys/fill_6140/xangle_120/" + sample,
	"data/phys/fill_6175/xangle_120/" + sample,
};

xSizeDef = 10cm;
ySizeDef = 10cm;

//----------------------------------------------------------------------------------------------------

for (int dsi : datasets.keys)
{
	NewRow();

	NewPad(false);
	label(replace(datasets[dsi], "_", "\_"));

	string f = topDir + datasets[dsi] + "/distributions.root";

	NewPad("cq1");
	draw(RootGetObject(f, "cuts/cut 1/h_q_cut1_before"), "vl,l", red, "before");
	draw(RootGetObject(f, "cuts/cut 1/h_q_cut1_after"), "vl", blue, "after");
	AttachLegend("cut 1");

	NewPad("cq2");
	draw(RootGetObject(f, "cuts/cut 2/h_q_cut2_before"), "vl,l", red, "before");
	draw(RootGetObject(f, "cuts/cut 2/h_q_cut2_after"), "vl", blue, "after");
	AttachLegend("cut 2");
}
