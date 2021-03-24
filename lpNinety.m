function  time = lpNinety(~,j) 
load('input_new.mat');
%% calculation of time for 
%% in/out ply movement
        
        time(1) =     oopTime_new(1) ...
            +   2 * oopTime_new(2) ...
            +   oopTime_new(3) ...
            *   ceil((partProps_new{j,2}
        / mtlProps_new(3)));
        
        %% calculation of time for 
        %% acceleration/deceleration and lay-up
        
        accDist = (progProps(2)^2)/
        (2*progProps(1));
        
        if accDist <= 
            ((partProps_new{j,3} / 2) + progProps(5))
            accTime = 
            sqrt(accDist / (0.5 * progProps(1)));
            constDist = ((partProps_new{j,3} / 2) + 
            progProps(5) - accDist) * 2;
        else
            accTime = sqrt(((partProps_new{j,3} / 2) 
            + progProps(5)) 
            / (0.5 * progProps(1)));
            constDist = 0;
        end
        
        accDecTime = 2 * accTime;
        constTime = constDist / progProps(2);
        
        time(2) = (accDecTime + constTime) *
        ceil((partProps_new{j,2} 
        / mtlProps_new(3)));
        
        %% calculation of time for 
        %% linking/inner-ply movement
        
        linkAccDist = ((progProps(4))^2)/
        (2 * progProps(3));
        linkDistUD = sqrt((partProps_new{j,3} +
        2 * progProps(5))^2 +
        (mtlProps_new(3))^2);
      
        
               if linkAccDist <= (linkDistUD / 2)
                    linkAccTime = 
                    sqrt(linkAccDist / (0.5 * progProps(3)));
                    linkConstDist = 
                    ((linkDistUD / 2) - linkAccDist) * 2;
                else
                    linkAccTime = sqrt((linkDistUD / 2) / 
                    (0.5 * progProps(3)));
                    linkConstDist = 0;
                end
                
           
     
        linkAccDecTime = 2 * linkAccTime;
        linkConstTime = linkConstDist / progProps(4);
        
        time(3) = (linkAccDecTime + linkConstTime) * 
        floor((partProps_new{j,2} / mtlProps_new(3)));
        time=time(1)+time(2)+time(3);
end
                