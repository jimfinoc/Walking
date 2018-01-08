step = 0
direction_M_FB = 1
direction_M_LR = 1
direction_T_LR = 1
head_M_UD = 0
head_T_LR = 0
input_feet = [155 0 -100;155 0 -100;-155 0 -100;-155 0 -100]
last_LR = 0
last_UD = 0
clc

filename = 'walking.gif';
az = 0; 
el = 0;
% az = 0
% el = 0

close all
figure
axis tight manual
hold on
grid on


for step = 1:20
    input_feet = drawRobotBody(step, direction_M_FB, direction_M_LR, direction_T_LR, head_M_UD, head_T_LR, input_feet, last_LR, last_UD)
    view(az, el);    
    frame = getframe(gcf); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if step == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end
    disp(step)
%     pause(1)
end
