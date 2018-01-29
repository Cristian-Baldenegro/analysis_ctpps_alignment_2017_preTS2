import sys 
import os
import FWCore.ParameterSet.Config as cms

sys.path.append(os.path.relpath("./"))
sys.path.append(os.path.relpath("../../../../../"))

from config_base import config
from input_files import input_files

config.input_files = input_files

config.aligned = True

config.cut1_c = -0.07

config.cut2_c = +0.07

config.matching_1d.rp_L_2_F.x_min = 2.0
config.matching_1d.rp_L_2_F.x_max = 4.8

config.matching_1d.rp_L_1_F.x_min = 2.3
config.matching_1d.rp_L_1_F.x_max = 4.8

config.matching_1d.rp_R_1_F.x_min = 2.0
config.matching_1d.rp_R_1_F.x_max = 3.6

config.matching_1d.rp_R_2_F.x_min = 2.0
config.matching_1d.rp_R_2_F.x_max = 3.4
