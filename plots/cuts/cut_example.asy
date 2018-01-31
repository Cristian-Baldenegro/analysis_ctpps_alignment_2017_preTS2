import root;
import pad_layout;

string topDir = "../../";

string dataset = "data/phys/fill_5950/xangle_120/ZeroBias";

TH2_palette = Gradient(blue, heavygreen, yellow, red);

//----------------------------------------------------------------------------------------------------

string f = topDir + "/" + dataset + "/distributions.root";

NewPad("$x(\hbox{45-210-fr})\ung{mm}$", "$x(\hbox{45-220-fr})\ung{mm}$");
scale(Linear, Linear, Log);
draw(RootGetObject(f, "cuts/cut 1/canvas_before|h2_x_L_2_F_vs_x_L_1_F_before"));
draw(RootGetObject(f, "cuts/cut 1/canvas_before|g_up"), "l", magenta+1pt);
draw(RootGetObject(f, "cuts/cut 1/canvas_before|g_down"), "l", magenta+1pt);
limits((5, 40), (25, 70), Crop);

/*
NewPad("$x(\hbox{56-210-fr})\ung{mm}$", "$x(\hbox{56-220-fr})\ung{mm}$");
scale(Linear, Linear, Log);
draw(RootGetObject(f, "cuts/cut 2/canvas_before|h2_x_R_2_F_vs_x_R_1_F_before"));
draw(RootGetObject(f, "cuts/cut 2/canvas_before|g_up"), "l", magenta+1pt);
draw(RootGetObject(f, "cuts/cut 2/canvas_before|g_down"), "l", magenta+1pt);
limits((5, 40), (25, 70), Crop);
*/

NewPad("$y(\hbox{45-210-fr})\ung{mm}$", "$y(\hbox{45-220-fr})\ung{mm}$");
scale(Linear, Linear, Log);
draw(RootGetObject(f, "cuts/cut 3/canvas_before|h2_y_L_2_F_vs_y_L_1_F_before"));
draw(RootGetObject(f, "cuts/cut 3/canvas_before|g_up"), "l", magenta+1pt);
draw(RootGetObject(f, "cuts/cut 3/canvas_before|g_down"), "l", magenta+1pt);
limits((-10, -10), (10, 10), Crop);
