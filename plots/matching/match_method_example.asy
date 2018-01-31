import root;
import pad_layout;

string topDir = "../../";

string dataset = "data/phys/fill_5848/xangle_120/SingleMuon";

string reference = "data_alig_fill_5685_xangle_120_DS1";

string rp = "L_1_F";

xSizeDef = 8cm;
ySizeDef = 6cm;

//----------------------------------------------------------------------------------------------------

//NewPad(false);
//label("{\SetFontSizesXX method x}");

//NewPad(false);
//label("{\SetFontSizesXX method y}");

//NewRow();

/*
NewPad("$x\ung{mm}$", "entries (scaled)");
//currentpad.yTicks = RightTicks(0.5, 0.1);

string p_base = rp + "/" + reference + "/method x/c_cmp|";
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_ref_sel"), "d0,eb", black);
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_bef"), "d0,eb", blue);
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_aft"), "d0,eb", red);

xlimits(4, 17, Crop);
*/


NewPad("$x\ung{mm}$", "std.~dev.~of $y\ung{mm}$");
currentpad.yTicks = RightTicks(0.5, 0.1);

string p_base = reference + "/" + rp + "/method y/c_cmp|";
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_ref_sel"), "d0,eb", black, "reference");
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_bef"), "d0,eb", blue, "before al.");
draw(RootGetObject(topDir + dataset+"/match.root", p_base + "h_test_aft"), "d0,eb", red, "after al.");

limits((4, 0), (17, 3), Crop);

AttachLegend(NW, NW);


GShipout(hSkip=10mm, vSkip=1mm);
