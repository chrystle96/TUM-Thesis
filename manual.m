%% AFP optimization 

for tape_count_new = 8:32 
% general manufacturing data definition

% total production volume

number_parts_new = 1; % total production volume

% material and placement head details

tape_width_new = 3.175; 
% width of one tape in mm

% track width for tapes on placement head
track_width_new = tape_width_new * tape_count_new; 
% bundled tape material definition
mtlProps_new = [tape_width_new, tape_count_new,
    track_width_new]; 
% times/details for manual production steps
 % visual inspection after every ply [min]
vi_time_new = 0.5;
 % quality inspection [testing evaluating] [min]
qi_time_new = [10 25];
% debulking in [min] after every first and 15th ply
dblk_time_new = [25 15]; 
 % bundled manual production parameters
mnlTime_new = [vi_time_new, qi_time_new(1), qi_time_new(2),
    dblk_time_new(1), dblk_time_new(2)];

%% geometry definition
 % specifies the geometrical shape of the part
geomDef_new = {'Plate'};

%% track linking
% linking type is unidirectional (UD) or bi-directional (BD)
linking_type_new = {'UD'}; 
%% ply data definition

% ply details
% fiber orientation is (0°/90°;+45°/-45°)      
fiber_orientation_new = {'0°','90°','+45°','-45°',
    '-45°','+45°','90°','0°'}; 

ply_length_new = 800;            
ply_width_new = 2400;            

% lay-up details

number_plies_new = 16;       
% pre-allocation for part properties

partProps_new = num2cell(zeros(number_plies_new,5)); 
for i = 1:(number_plies_new)
    if(i<9)
        partProps_new(i,:) = {fiber_orientation_new{i},
            ply_length_new,ply_width_new,linking_type_new{1},
            geomDef_new{1}};        
    else
        partProps_new(i,:) = partProps_new(i-8,:);
    end
 end

partProps_new(4,:) = partProps_new(3,:);
partProps_new(5,:) = partProps_new(2,:);
partProps_new(6,:) = partProps_new(1,:);

%% programming details
% deceleration distance in mm
acc_dec_distance_new = 65; 
% reduction for acceleration and velocities for first ply
first_ply_reduction_new = 0.55; 
% error rate on overal production time
error_rate_new = 1.25; 
% decision variable for first ply consideration
frstPlyRdct_new = 0.55; 
% decision variable for error rate consideration
errRtRdct_new  = 1.25;
% bundled reduction factors for production properties
rdctFactors_new = [first_ply_reduction_new error_rate_new]; 

% out of ply movement
% buffer time before head movement in seconds per ply
buffer_time_new = 3;
% time to start/final position in seconds per ply
start_final_position_time_new = 3; 
% time for z positioning (in/out) in seconds per track
z_positioning_time_new = 3; 
% bundled out of ply movement properties
oopTime_new = [buffer_time_new,
    start_final_position_time_new, z_positioning_time_new]; 

% flat plate programming details
% layup acceleration in m/s^2
layup_acceleration_new = 0.5;   
 % layup velocity in m/s
layup_velocity_new = 0.5;      
% linking acceleration in m/s^2
linking_acceleration_new = 1; 
% linking velocity in m/s
linking_velocity_new = 1.5;     

% bundled programming details

progProps(1,:) = [layup_acceleration_new,
    layup_velocity_new,...
                          linking_acceleration_new, 
                          linking_velocity_new,...
                          acc_dec_distance_new / 1000];
%% save input.mat file to current folder
save('input_new.mat')
load('input_new.mat')
%% total AFP process time
% total production time is calculated 
%from the total layup/linking times
% for all parts and the times for 
%visual inspection and debulking
% converting manual times from [min] to [s]
mnlTime_new(1:4) = mnlTime_new(1:4) * 60; 
%% visual inspection
% calculation of visual inspection time based 
%on number of plies and
% estimated time for visual inspection
vi_time_new = 
size(partProps_new,1) * mnlTime_new(1);
% debulking
% calculation of debulking times based
%on debulking parameters
dblkTime = floor(((size(partProps_new,1) - 1) 
/ mnlTime_new(5))+1) * mnlTime_new(4);
%product time per fibre
oris=partProps_new(1:size(partProps_new,1));
total_layup=0;
for i= 1:size(partProps_new,2)+1
    total_layup=total_layup+prdctTime(oris(i),i);
end

AFPProcessTime= total_layup+vi_time_new+dblkTime
end