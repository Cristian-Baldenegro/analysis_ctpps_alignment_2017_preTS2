import FWCore.ParameterSet.Config as cms

config = cms.PSet(
    n_si = cms.double(4.),

	cut1_apply = cms.bool(False),
	cut1_a = cms.double(1),
	cut1_c = cms.double(0),
	cut1_si = cms.double(0),

	cut2_apply = cms.bool(False),
	cut2_a = cms.double(1),
	cut2_c = cms.double(0),
	cut2_si = cms.double(0),

	cut3_apply = cms.bool(False),
	cut3_a = cms.double(1),
	cut3_c = cms.double(0),
	cut3_si = cms.double(0),

	cut4_apply = cms.bool(False),
	cut4_a = cms.double(1),
	cut4_c = cms.double(0),
	cut4_si = cms.double(0)
)
