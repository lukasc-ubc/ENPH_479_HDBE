Instructions on how to use the scripts:

topLevel.m

This is the file that is actually run when you want the entire netlist generation and simulation to begin. It will open INTERCONNECT automatically, simulate the switch, and store the results in a .mat file under the same directory.
The top 4 parameters in the file can be tweaked (size of N, use waveguides or not, use best or worst path, and Monte Carlo or not)
It calls the files below

generateNetlist.m

This sets up all the required headers and special text in netlists
It then calls generateSwitch.m below
Note that if you want to run it with different switch architectures, line 21 and 22 must be changed in this file (‘BDC_switch_ideal’ to the one you want to use)

generateSwitch.m

This is where the majority of the logic is. It is quite long due to the fact that the pattern was not trivial to implement. It is also recursive in nature.
At a basic level, it creates all the switch/waveguide/crossing objects as matlab objects and connects them together properly.

analyzeResults.m

This file can be run after the above topLevel.m is run. It grabs the saved .mat data from INTERCONNECT and then analyzes it in matlab creating plots.
Note that there are some hard coded parameters here, namely ‘bestOrWorst’ and ‘switch_designs’ used to extract the data from the appropriate simulation results file.
If this analysis file doesn’t suit your needs, you can implement your own analysis given the result of the simulations without any impacts on the rest of the files.

analyzeResults2.m

This file is another script we used to analyze data. It plots a bar chart of a selected metric vs. size of the switch.
Two parameters of ‘bestOrWorst’ and ‘param’ can be tweaked to select which simulation (best, worst, or mc) and which parameter (IL (insertion loss), XT (crosstalk), EXR (extinction ratio) to plot.
