function [isMoving] = moveStep(stepSize, Motor)
%moveStep this sets motor speed and accelration and then moves 1 step in
%ths size desired. stepSize in meters.
%Motor.StartCtrl;  
%Motor.Identify; 
    stepSize = stepSize*1E3;
    jogDirection = 1; % forward
    if stepSize<0
        stepSize = abs(stepSize);
        jogDirection = 2; % backward
    end
    
    if stepSize > 0.5
        Motor.SetJogVelParams(0, 0, 5, 5);
    elseif stepSize > 0.05
        Motor.SetJogVelParams(0, 0, 0.5, 0.5);
    else
        Motor.SetJogVelParams(0, 0, 0.05, 0.05);
    end 
   
    
    Motor.SetJogStepSize(0, stepSize);    % set distance in mm. minimum 10 micron
    Motor.MoveJog(0, jogDirection); % constant velocity movement
    isMoving=1;
    while(isMoving)
        s = Motor.GetStatusBits_Bits(0);
        isMoving = ~bitget(abs(s),30); 
        pause(0.03);
    end 
    
    
end

