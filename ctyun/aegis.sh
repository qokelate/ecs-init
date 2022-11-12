#!/bin/bash

cd /CloudrResetPwdAgent/bin
./cloudResetPwdAgent.script stop
./cloudResetPwdAgent.script remove

cd /CloudResetPwdUpdateAgent/bin
./cloudResetPwdUpdateAgent.script stop
./cloudResetPwdUpdateAgent.script remove

cd /tmp
rm -rf /CloudrResetPwdAgent
rm -rf /CloudResetPwdUpdateAgent

exit
