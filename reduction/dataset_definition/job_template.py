import FWCore.ParameterSet.Config as cms

process = cms.Process("reduction")

# minimum of logs
process.MessageLogger = cms.Service("MessageLogger",
  statistics = cms.untracked.vstring(),
  destinations = cms.untracked.vstring('cout'),
  cout = cms.untracked.PSet(
    threshold = cms.untracked.string('WARNING')
  )
)

# data source
process.source = cms.Source("PoolSource",
  fileNames = cms.untracked.vstring(
$input_files
  ),

  inputCommands = cms.untracked.vstring(
    'drop *',
    'keep CTPPSLocalTrackLites_*_*_*'
  )
)

# apply JSON file
import FWCore.PythonUtilities.LumiList as LumiList
import FWCore.ParameterSet.Types as CfgTypes
process.source.lumisToProcess = CfgTypes.untracked(CfgTypes.VLuminosityBlockRange())
JSONfile = 'run_ls_selection.json'
myLumis = LumiList.LumiList(filename = JSONfile).getCMSSWString().split(',')
process.source.lumisToProcess.extend(myLumis)

# TODO: comment out
#process.maxEvents = cms.untracked.PSet(
#  input = cms.untracked.int32(100)
#)

# output configuration
process.output = cms.OutputModule("PoolOutputModule",
  fileName = cms.untracked.string("$output_file")
)

process.outpath = cms.EndPath(process.output)
