% Whack-a-Mole Project
% BBBBPE (Team W8)
% November 8th, 2015

% File Description: Top level code for the whackAMole game.

function whackAMole(tg, handles)
% Inputs:
% 'tg'  - Variable linked to xpc.
% 'vid' - Variable linked to the camera.
% 'QR'  - QR string from GUI file.
%
% Return Value: None.

% Local variables.
colors = {'Red', 'Green', 'Yellow'};
motor_wait = 1;
time_down = 0.1;

% Connect to camera.
vid = videoinput('winvideo', 2,'MJPG_640x480'); % 1 = Onboard Camera,
set(vid, 'ReturnedColorSpace', 'RGB');          % 2 = USB Camera

% Get background image.
background = getsnapshot(vid);

% Start XPC if it is stopped.
if(strcmp(tg.status, 'stopped') == 1)
    tg.start;
end

% Start timing.
tic;
set(handles.TimeBlock, 'String', '');

% Find bounds.
moles = 0;
if(handles.round == 1) 
    % No tricks round.
    set(handles.ColorBlock, 'String', 'Round 1');
    
    while(moles < handles.bound && strcmp(tg.status, 'running') == 1)
        % Image process.
        [color, sectionNumber] = imageProcess(vid, background);

        if(color ~= -1)
            % Whack all moles in round one.
            if(sectionNumber ~= 1)
                moveToSection(tg, sectionNumber, motor_wait);
            end
            
            % Whack Mole.
            fireSolenoid(tg, time_down);
            
            % Move back to section 1.    
            if(sectionNumber ~= 1)
                moveToSection(tg, 1, motor_wait);
            end
            
            % Increment moles.
            moles = moles + 1;
        end
    end
else
    while(moles < handles.bound && strcmp(tg.status, 'running') == 1)
        % Update Display.
        set(handles.ColorBlock, 'String', colors(handles.sequence(moles + 1)));
        
        % Image process.
        [color, sectionNumber] = imageProcess(vid, background);

        if(color ~= -1)
            % Whack moles in rounds 2-4 if color matches mole.
            if(handles.sequence(moles + 1) == color)
                % LED found. Move to correct section.
                if(sectionNumber ~= 1)
                    moveToSection(tg, sectionNumber, motor_wait);
                end
                
                % Whack Mole.
                fireSolenoid(tg, time_down);
            
                % Move back to section 1.
                if(sectionNumber ~= 1)
                    moveToSection(tg, 1, motor_wait);
                end
                
                % Increment moles.
                moles = moles + 1;
            end
        end
    end
end

% Stop Simulink.
tg.stop;

% Make color display blank and display time.
time = toc;
set(handles.TimeBlock, 'String', time);
set(handles.ColorBlock, 'String', '');