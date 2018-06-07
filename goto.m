
clear all
close all
clc

r=5; %position to be reached
a=0; %initial position


x_old=a;
x_new=a;


%gain
k=1.3;
%time step
t=.1;

% max iteration
Max_iteration=75;

%To record position and velocity values
pos = zeros(1,Max_iteration); 
vel = zeros(1,Max_iteration);

for m = 1: Max_iteration
    
    % Initial velocity if we give it as zeros there is some error.....
    if x_new == 0
        v = 0.15;
        arr(m) = v;
    else
    if x_new == r  %Stop simulation if destination is reached
        v = 0;
        arr(m) = v;
    else
        x_des = r;
        if x_new > r/2
             error = x_des - x_new;
        else
            error = x_new;
        end
        v = k*error;
        arr(m) = v;
    end
    end
    
        % unicycle model system dynamics
        x_new = x_old + v * t;
        num(m) = x_new;
        pause(t);        
        x_old=x_new;          
        
end 

time = [1:Max_iteration];
plot(time,pos);
grid on;
xlabel('Time');
ylabel('Velocity and Position');
hold on;
plot(time,vel);
legend('pos','vel');
