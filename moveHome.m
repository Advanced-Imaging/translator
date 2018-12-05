function [] = moveHome(Motor)
% move back from wherever it is to 0
    antibacklash = 1E-5;
    homePos = 3.00000;  % in mm, TODO
    Motor.SetAbsMovePos(0, homePos-antibacklash*1E3);    
    Motor.MoveAbsolute(0, 0);
    isMoving=1;
    while(isMoving)
        s = Motor.GetStatusBits_Bits(0);
        isMoving = ~bitget(abs(s),30); 
        pause(0.04);
    end 
    
    moveStep(antibacklash, Motor);
end

