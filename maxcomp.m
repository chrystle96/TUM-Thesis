%% Optimization based on Maximum Compaction
%%Extraction
bench1;

m1_1=om1_1/3600;
m2_1=om2_1/3600;
%%
m1_2=om1_2/3600;
m1_3=om1_3/3600;
m1_4=om1_4/3600;
m1_5=om1_5/3600;
m2_2=om2_2/3600;
m2_3=om2_3/3600;
m2_4=om2_4/3600;
m2_5=om2_5/3600;
%% PLOT 
%case 1
figure()
bar([bench1; m1_1; m2_1 ], 'stacked'); 
title('Case 1')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 3', 'Optimized Compaction 4'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')
%case2
figure()
bar([bench2; m1_2; m2_2 ], 'stacked'); 
title('Case 2')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 3', 'Optimized Compaction 4'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')
%case3 
figure()
bar([bench3; m1_3; m2_3], 'stacked'); 
title('Case 3')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 3', 'Optimized Compaction 4'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')
%case4
figure()
bar([bench4; m1_4; m2_4 ], 'stacked'); 
title('Case 4')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 3', 'Optimized Compaction 4'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')
%case5
figure()
bar([bench5; m1_5; m2_5], 'stacked'); 
title('Case 5')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 3', 'Optimized Compaction 4'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')

%% Production scenario comparison 
 figure()
 plot([sum(bench1), sum(bench2), sum(bench3), sum(bench4), sum(bench5)],'--gs');
 hold on 
 pl2=plot([sum(m1_1), sum(m1_2), sum(m1_3), sum(m1_4), sum(m1_5)],'r-o');
 hold on
 pl3=plot([sum(m2_1), sum(m2_2), sum(m2_3), sum(m2_4), sum(m2_5)],'b-*','MarkerSize',10);
 hold on
 grid on
 title('Determination of break-even point')
 legend('Benchmark','Optimized Compaction 3', 'Optimized Compaction 4');
 xlabel('Production Scenarios')
 xticks([1 2 3 4 5])
 xticklabels({'Case 1', 'Case 2', 'Case 3', 'Case 4','Case 5'})
 ax = gca;
 ax.YAxis.Exponent = 0;
 ylabel('AFP Process Time (hours)')
 %% X: Axis
x1=31500000;
x2=105000000;
x3=420000000;
x4=1050000000;
x5=2362500000;
x_cord=[x1 x2 x3 x4 x5];
max_comp1=[sum(m1_1) sum(m1_2) sum(m1_3) sum(m1_4) sum(m1_5)];
max_comp2=[sum(m2_1) sum(m2_2) sum(m2_3) sum(m2_4) sum(m2_5)];
bench=[sum(bench1) sum(bench2) sum(bench3) sum(bench4) sum(bench5)];

%% PLOT
plot(x_cord/(10^9), bench,'g--');
hold on 
plot(x_cord/(10^9), max_comp1,'r--')
hold on 
plot(x_cord/(10^9), max_comp2,'b--');
hold on
title('AFP layup time in terms of total area of layup')
xlabel('Total Areas, 10^9 (sq.mm)')
ylabel('AFP Layup Time (hours)')
legend('Benchmark','Optimized Compaction 3','Optimized Compaction 4')
%%
figure()
[x0_max,y0_max]=intersections(x_cord/(10^9), bench, x_cord/(10^9), max_comp2);
grid on 
legend('Benchmark', 'Optimized Model 4')
title('Comparison of the Optimized model 4 with the benchmark')
xlabel('Total Areas, 10^9 (sq.mm)')   
ylabel('AFP Layup Time (hours)')