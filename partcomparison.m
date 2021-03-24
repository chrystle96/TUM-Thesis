%% Part Comparison for case 4 

% Case 4 1000 parts
for k=1:numel(sheet_name)
   data4{k}=xlsread('C:\Users\User\exprt\exprt4.xlsx',sheet_name{k});
end
  [e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22, e23, e24, e25]=process(data4);
% Case 4 1 part

% Case 4
for k=1:numel(sheet_name)
   datao{k}=xlsread('C:\Users\User\exprt\exprt.xlsx',sheet_name{k});
end
  [o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25]=process(datao);

 figure()
 plot([sum(e1) sum(e2) sum(e3) sum(e4) sum(e5) sum(e6) sum(e7) sum(e8) sum(e9) sum(e10) sum(e11) sum(e12) sum(e13) sum(e14) sum(e15) sum(e16) sum(e17) sum(e18) sum(e19) sum(e20) sum(e21) sum(e22) sum(e23) sum(e24) sum(e25)]');
 hold on 
 plot([sum(o1) sum(o2) sum(o3) sum(o4) sum(o5) sum(o6) sum(o7) sum(o8) sum(o9) sum(o10) sum(o11) sum(o12) sum(o13) sum(o14) sum(o15) sum(o16) sum(o17) sum(o18) sum(o19) sum(o20) sum(o21) sum(o22) sum(o23) sum(o24) sum(o25)]');
 hold on 
 title('AFP Time different production scenarios')
 legend('Case 1','Case 2');
 xlabel('Process Parameter Variations')
 ax = gca;
 ax.YAxis.Exponent = 0;
 ylabel('AFP Process Time (hours)')