import root;
import pad_layout;

string topDir = "../../";

/*
string reference = "data_alig_fill_5912_xangle_120_DS1";
string datasets[] = {
	"data/alig_orig/fill_5685/xangle_120/DS1"
};
*/

string reference = "data_alig_fill_5685_xangle_120_DS1";

string datasets[] = {
	"data/phys/fill_5848/xangle_120/SingleMuon"
};

string rp_tags[], rp_labels[];
//rp_tags.push("L_2_F"); rp_labels.push("45-220-fr");
//rp_tags.push("L_1_F"); rp_labels.push("45-210-fr");
rp_tags.push("R_1_F"); rp_labels.push("56-210-fr");
rp_tags.push("R_2_F"); rp_labels.push("56-220-fr");

xSizeDef = 8cm;

xTicksDef = LeftTicks(2., 1.);
yTicksDef = RightTicks(0.5, 0.1);

//----------------------------------------------------------------------------------------------------

NewPad(false);

for (int rpi : rp_tags.keys)
{
	NewPad(false);
	label("{\SetFontSizesXX " + rp_labels[rpi] + "}");
}

for (int dsi : datasets.keys)
{
	string dataset = datasets[dsi];

	NewRow();

	NewPad(false);
	string bits[] = split(replace(dataset, "_", "\_"), "/");
	label("\vbox{\SetFontSizesXX\hbox{" + bits[2] + "}\hbox{" + bits[3] + "}\hbox{" + bits[4] + "}}");
	
	for (int rpi : rp_tags.keys)
	{
		NewPad("$x\ung{mm}$", "std.~dev.~of $y\ung{mm}$");
	
		string p_base = reference + "/" + rp_tags[rpi] + "/method y/c_cmp|";
		draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_ref_sel"), "d0,eb", black);
		draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_bef"), "d0,eb", blue);
		draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_aft"), "d0,eb", red);
	
		limits((0, 0), (14, 3), Crop);
	}
}

GShipout(hSkip=1mm, vSkip=1mm);
