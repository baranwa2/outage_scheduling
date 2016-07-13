function []=sendJob(funcName,funcArgs,jobArgs,config)
%% prepare arguments for the python script file
[tempPythonLocalFilePath,logDir,matlabInnerCode,MATLAB_PATH,tempPyhonRemotePath]=prepareScriptArguments(funcName,funcArgs,jobArgs,config);

%% build the python script file
createTempPythonFile(tempPythonLocalFilePath,logDir,matlabInnerCode,MATLAB_PATH,jobArgs)

%% send job
sendSSHCommand(['chmod u+x ',tempPyhonRemotePath]);
sendSSHCommand(tempPyhonRemotePath);
