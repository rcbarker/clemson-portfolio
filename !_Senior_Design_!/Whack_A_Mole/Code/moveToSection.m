% Whack-a-Mole Project
% BBBBPE (Team W8)
% November 10th, 2015

% File Description: Contains code for moving the game cart and arm to a 
% specified section of the game board.

function moveToSection(tg, section_num, wait_time)
% Inputs:
% 'tg'          - Variable linked to the xpc model running on the machine 
%                 (In top level code, tg = xpc).
% 'section_num' - The section number of the board to move to. 
%                 1 <= section_num <= 8.
% 'wait_time'   - The amount of time to wait for the motor to move in 
%                 seconds.
% Return Value: None.

% Connect to motor:
id = tg.getparamid('MotorPos', 'Value');

% Move to specified section of board:
if(section_num == 1)
    % Section 1
    tg.setparam(id, 0);
elseif(section_num == 2)
    % Section 2
    tg.setparam(id, 145);
elseif(section_num == 3)
    % Section 3
    tg.setparam(id, 270);
elseif(section_num == 4)
    % Section 4
    tg.setparam(id, 420);
elseif(section_num == 5)
    % Section 5
    tg.setparam(id, 547);
elseif(section_num == 6)
    % Section 6
    tg.setparam(id, 690);
elseif(section_num == 7)
    % Section 7
    tg.setparam(id, 825);
else
    % Section 8
    tg.setparam(id, 948);
end

pause(wait_time);
end