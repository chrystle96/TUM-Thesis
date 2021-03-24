function  time = lpFortyfive(~,j)
load('input_new.mat');
%% track length definition
% this section calculates the track length of each 
%individual track for a
% +/-45° fiber orientation

n = 1;
% distance from the starting corner
c_n = sqrt(2*n) * mtlProps_new(3); 
l_n = zeros(1,ceil((partProps_new{j,2} + 
partProps_new{j,3})/
(sqrt(2) * mtlProps_new(3)))); 

if partProps_new{j,3} <= partProps_new{j,2}
    while c_n <= partProps_new{j,3}
        && c_n <= partProps_new{j,2}
        %track length for track n
        l_n(n) = sqrt(2) * c_n; 
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;
    end
    while c_n > partProps_new{j,3}
        && c_n < (partProps_new{j,2} + 
        sqrt(2) * mtlProps_new(3))
        l_n(n) = sqrt(2) * partProps_new{j,3}
        + mtlProps_new(3);
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;        
    end
    while c_n > partProps_new{j,3} 
        && c_n >= (partProps_new{j,2} + 
        sqrt(2) * mtlProps_new(3)) 
        && c_n < (partProps_new{j,2} +
        partProps_new{j,3} + sqrt(2)
        * mtlProps_new(3))
        l_n(n) = sqrt(2) * 
        (partProps_new{j,2} + partProps_new{j,3}
        - c_n + sqrt(2) * mtlProps_new(3));
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;    
    end

elseif partProps_new{j,3} > partProps_new{j,2}
    while c_n <= partProps_new{j,3} 
        && c_n <= partProps_new{j,2}
        l_n(n) = sqrt(2) * c_n;
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;        
    end
    while c_n < (partProps_new{j,3} 
        + sqrt(2) * mtlProps_new(3))
        && c_n > partProps_new{j,2}
        l_n(n) = sqrt(2) * partProps_new{j,2}
        + mtlProps_new(3);
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;        
    end
    while c_n >= (partProps_new{j,3} +
        sqrt(2) * mtlProps_new(3))
        && c_n > partProps_new{j,2} 
        && c_n < (partProps_new{j,2} +
        partProps_new{j,3} +
        sqrt(2) * mtlProps_new(3))
        l_n(n) = sqrt(2) * (partProps_new{j,2}
        + partProps_new{j,3}
        - c_n + sqrt(2) * mtlProps_new(3));
        c_n = c_n + sqrt(2) * mtlProps_new(3);
        n = n + 1;        
    end
end

%% UD production time calculation

% based on the previous track length 
%calculation a production time
% calculation is carried out for each 
%individual track. The sum of these
% procuction times will give the total
%production time of a single +/-45°
% ply

% calculation of time for in/out ply movement

time(1) =     oopTime_new(1) ...
    +   2 * oopTime_new(2) ...
    +   oopTime_new(3) ...
    *   numel(l_n);

% calculation of time for
%acceleration/deceleration and lay-up

accDist = (progProps(2)^2)/(2*progProps(1));
accDecTime = zeros(1,numel(l_n)); 
constTime = zeros(1,numel(l_n)); 
linkAccDecTime = zeros(1,numel(l_n));
linkConstTime = zeros(1,numel(l_n)); 

c = zeros(size(partProps_new,1),1); 
for m = 1:numel(c)
    c(m) = (partProps_new{m,2}
    + partProps_new{m,3}); 
end % for pre-allocation purposes

analysis = zeros(ceil(max(c)/(sqrt(2)
* mtlProps_new(3))),5); 

for m = 1:numel(l_n)

if accDist < ((l_n(m) / 2) + progProps(5))
    accTime = sqrt(accDist /
    (0.5 * progProps(1)));
    constDist = ((l_n(m) / 2) +
    progProps(5) - accDist) * 2;
else
    accTime = sqrt(((l_n(m) / 2)
    + progProps(5)) / 
    (0.5 * progProps(1)));
    constDist = 0;
end

accDecTime(m) = 2 * accTime;
constTime(m) = constDist / progProps(2);

analysis(m,1) = l_n(m);
analysis(m,2) = accDecTime(m);
analysis(m,3) = constTime(m);
end

% calculation of time for
%linking/inner-ply movement

for m = 1 : (numel(l_n) - 1)
    
linkAccDist = ((progProps(4))^2)/
(2 * progProps(3));
linkDistUD = sqrt((0.5 * (l_n(m) +
l_n(m+1)) + 2 * progProps(5))^2 +
(mtlProps_new(3))^2);



        if linkAccDist < (linkDistUD / 2)
            linkAccTime = 
            sqrt(linkAccDist / (0.5 * progProps(3)));
            linkConstDist = 
            ((linkDistUD / 2) - linkAccDist) * 2;
        else
            linkAccTime = sqrt((linkDistUD / 2) /
            (0.5 * progProps(3)));
            linkConstDist = 0;
        end
        
    


linkAccDecTime(m) = 2 * linkAccTime;
linkConstTime(m) = 
linkConstDist / progProps(4);

analysis(m,4) = linkAccDecTime(m);
analysis(m,5) = linkConstTime(m);
end

%% writing output parameters

% production time of single ply
time(2) = (sum(accDecTime) + 
sum(constTime));
time(3) = (sum(linkAccDecTime) + 
sum(linkConstTime));
 
time=time(1)+time(2)+time(3);


end