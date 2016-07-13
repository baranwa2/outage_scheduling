function [tempPythonLocalFilePath,logDir,matlabInnerCode,MATLAB_PATH,tempPyhonRemotePath]=prepareScriptArguments(funcName,funcArgs,jobArgs,config)
%% function arguments - struct
remoteIterDir=funcArgs.remoteIterDir;
argContentFilename=funcArgs.argContentFilename;
localIterDir=funcArgs.localIterDir;
jobName=jobArgs.jobName;

funcArgsStr=[ '''' , remoteIterDir , '''' , ',' , '''' , argContentFilename , '''' ];

%% matlab call string
MATLAB_PATH = '/usr/local/bin/matlab';
WORK_PATH = config.REMOTE_SERVER_MATLAB_WORKPATH;
logDir = [remoteIterDir , '/..'];
tempJobsFileLocalPath= [localIterDir , '/../tempJobFiles/'];
tempPyhonRemotePath= [remoteIterDir , '/../tempJobFiles/'];

matlabInnerCode=[ ' "cd(''' , WORK_PATH , ''');,warning off,' , funcName , '(' , funcArgsStr , ');"' ];
tempPythonFilename    = [ jobName , '.py'];
tempPythonLocalFilePath = [ tempJobsFileLocalPath , tempPythonFilename ];
tempPyhonRemotePath = [ tempPyhonRemotePath , tempPythonFilename ];
