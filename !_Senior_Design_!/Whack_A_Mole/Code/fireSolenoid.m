% Whack-a-Mole Project
% BBBBPE (Team W8)
% November 8th, 2015

% File Description: Contains code for firing the solenoid connected to the
% final design's arm to "whack moles". 

function fireSolenoid(tg, time)
% Inputs:
% 'tg'   - Variable linked to the xpc model running on the machine (In top
%          level code, tg = xpc).
% 'time' - Time (in seconds) the solenoid arm should be in contact with the
%          pushbutton it is pressing.
%
% Return Value: None.

id = tg.getparamid('Solenoid', 'Value');
tg.setparam(id, 1);
pause(time);
tg.setparam(id, 0);

end