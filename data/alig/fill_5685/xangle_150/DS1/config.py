import sys 
import os
import FWCore.ParameterSet.Config as cms

sys.path.append(os.path.relpath("./"))
sys.path.append(os.path.relpath("../../../../../"))

from config_base import config
from input_files import input_files

config.input_files = input_files

config.aligned = True

config.alignment_corrections.rp_L_2_F.de_x = -42.525
config.alignment_corrections.rp_L_1_F.de_x = -4.4
config.alignment_corrections.rp_R_1_F.de_x = -3.275
config.alignment_corrections.rp_R_2_F.de_x = -42.475

config.cut1_a = -1.007
config.cut1_c = -0.20

config.cut2_a = -0.983
config.cut2_c = -0.09

config.matching_1d.reference_datasets = cms.vstring("data/alig/fill_5912/xangle_120/DS1")

config.matching_1d.rp_L_2_F.x_min = 2.3
config.matching_1d.rp_L_2_F.x_max = 21
config.matching_1d.rp_L_2_F.sh_min = -0.5
config.matching_1d.rp_L_2_F.sh_max = +0.5

config.matching_1d.rp_L_1_F.x_min = 2.5
config.matching_1d.rp_L_1_F.x_max = 21
config.matching_1d.rp_L_1_F.sh_min = -0.5
config.matching_1d.rp_L_1_F.sh_max = +0.5

config.matching_1d.rp_R_1_F.x_min = 2.3
config.matching_1d.rp_R_1_F.x_max = 21
config.matching_1d.rp_R_1_F.sh_min = -0.5
config.matching_1d.rp_R_1_F.sh_max = +0.5

config.matching_1d.rp_R_2_F.x_min = 2.5
config.matching_1d.rp_R_2_F.x_max = 21
config.matching_1d.rp_R_2_F.sh_min = -0.5
config.matching_1d.rp_R_2_F.sh_max = +0.5
