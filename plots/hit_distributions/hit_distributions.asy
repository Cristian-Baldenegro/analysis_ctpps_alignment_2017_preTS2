import root;
import pad_layout;

string topDir = "../../";

string rp_tags[], rp_labels[];
//rp_tags.push("L_2_F"); rp_labels.push("45-220-fr (pixel)");
rp_tags.push("L_1_F"); rp_labels.push("45-210-fr (strip)");
rp_tags.push("R_1_F"); rp_labels.push("56-210-fr (strip)");
//rp_tags.push("R_2_F"); rp_labels.push("56-220-fr (pixel)");

string selection = "before selection";

string datasets[] = {
//	"data/alig/fill_5685/xangle_120/DS1",
	"data/alig/fill_5912/xangle_120/DS1",
	"data/alig_v5_test/fill_5912/xangle_120/DS1",

//	"data/phys/fill_5848/xangle_120/SingleMuon",
//	"data/phys/fill_5976/xangle_120/SingleMuon",
//	"data/phys/fill_6161/xangle_120/SingleMuon",
//	"data/phys/fill_6186/xangle_120/SingleMuon",
};

//----------------------------------------------------------------------------------------------------

NewPad(false);
label(selection);

for (int rpi : rp_tags.keys)
{
	NewPad(false);
	label("{\SetFontSizesXX " + rp_labels[rpi] + "}");
}


for (int dsi : datasets.keys)
{
	NewRow();

	NewPad(false);
	label("{\SetFontSizesXX " + replace(datasets[dsi], "_", "\_") + "}");

	string f = topDir + datasets[dsi] + "/distributions.root";

	for (int rpi : rp_tags.keys)
	{
		bool pixel = (find(rp_labels[rpi], "pixel") >= 0);

		NewPad("$x\ung{mm}$", "$y\ung{mm}$");
		scale(Linear, Linear, Log);

		string suffix = (selection == "before selection") ? "_no_sel" : "_sel";

		draw(RootGetObject(f, selection + "/h2_y_vs_x_" + rp_tags[rpi] + suffix));

		if (pixel)
			limits((40, -20), (70, +20), Crop);
		else
			limits((0, -20), (30, +20), Crop);
	}
}
