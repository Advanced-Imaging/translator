function [sampl_mtr] = initMotor(SerialNumber)
%setMotor this funciton sets a new motor named sampl_mtr
% Create Matlab Figure Container
% SerialNumber = 27000356;
fpos    = get(0, 'DefaultFigurePosition'); % figure default position
fpos(3) = 650; % figure window width
fpos(4) = 450; % height
f1 = figure('Position', fpos, 'Menu', 'None', 'Name', 'Sample controller GUI');
f1.NumberTitle='off';
% Create and initialize ActiveX controller
sampl_mtr = actxcontrol('MGMOTOR.MGMotorCtrl.1', [20 20 600 400], f1);
set(sampl_mtr, 'HWSerialNum', SerialNumber); % serial number
sampl_mtr.StartCtrl;                     % Start Control
sampl_mtr.Identify;                      % Indentify the device
sampl_mtr.SetJogStepSize(0, 0.001);    % set distance in mm. minimum 10 micron
sampl_mtr.SetJogVelParams(0, 0, 0.01, 0.01); % channel ID, ???, acc, vel
end

