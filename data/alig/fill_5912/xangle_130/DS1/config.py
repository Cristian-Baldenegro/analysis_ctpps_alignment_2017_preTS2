import sys 
import os
import FWCore.ParameterSet.Config as cms

sys.path.append(os.path.relpath("./"))
sys.path.append(os.path.relpath("../../../../../"))

from config_base import config
from input_files import input_files

config.input_files = input_files

config.cut1_a = -1.01
config.cut1_c = -38.25
config.cut1_si = 0.2

config.cut2_a = -0.99
config.cut2_c = -39.25
config.cut2_si = 0.2
