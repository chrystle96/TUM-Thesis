%% Extraction 

% Case 1
[~,sheet_name]=xlsfinfo('C:\Users\User\exprt\exprt6.xlsx');
for k=1:numel(sheet_name)
  data6{k}=xlsread('C:\Users\User\exprt\exprt6.xlsx',sheet_name{k});
end
g1=cell2mat(data6(1,1));
g1=g1(1:3, 1)/3600;

g2=cell2mat(data6(1,2));
g2=g2(1:3, 1)/3600;

g3=cell2mat(data6(1,3));
g3=g3(1:3, 1)/3600;

g4=cell2mat(data6(1,4));
g4=g4(1:3, 1)/3600;

g5=cell2mat(data6(1,5));
g5=g5(1:3, 1)/3600;

figure()
bar([g1 g2 g3 g4 g5]', 'stacked'); 


title('Case 1')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 1', 'Optimized Compaction 2', 'Minimum Compaction', 'Maximum Compaction'})
xlabel('Optimized Models')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')


% Case 2
[~,sheet_name]=xlsfinfo('C:\Users\User\exprt\exprt7.xlsx');
for k=1:numel(sheet_name)
  data7{k}=xlsread('C:\Users\User\exprt\exprt7.xlsx',sheet_name{k});
end

h1=cell2mat(data7(1,1));
h1=h1(1:3, 1)/3600;

h2=cell2mat(data7(1,2));
h2=h2(1:3, 1)/3600;

h3=cell2mat(data7(1,3));
h3=h3(1:3, 1)/3600;

h4=cell2mat(data7(1,4));
h4=h4(1:3, 1)/3600;

h5=cell2mat(data7(1,5));
h5=h5(1:3, 1)/3600;

figure()
hk=bar([h1 h2 h3 h4 h5]', 'stacked'); 

title('Case 2')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 1', 'Optimized Compaction 2', 'Minimum Compaction', 'Maximum Compaction'})
xlabel('Parameter Sets')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')



% Case 3
[~,sheet_name]=xlsfinfo('C:\Users\User\exprt\exprt8.xlsx');
for k=1:numel(sheet_name)
  data8{k}=xlsread('C:\Users\User\exprt\exprt8.xlsx',sheet_name{k});
end
i1=cell2mat(data8(1,1));
i1=i1(1:3, 1)/3600;

i2=cell2mat(data8(1,2));
i2=i2(1:3, 1)/3600;

i3=cell2mat(data8(1,3));
i3=i3(1:3, 1)/3600;

i4=cell2mat(data8(1,4));
i4=i4(1:3, 1)/3600;

i5=cell2mat(data8(1,5));
i5=i5(1:3, 1)/3600;

figure()
ik=bar([i1 i2 i3 i4 i5]', 'stacked'); 

title('Case 3')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 1', 'Optimized Compaction 2', 'Minimum Compaction', 'Maximum Compaction'})
xlabel('Parameter Sets')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')


% Case 4
[~,sheet_name]=xlsfinfo('C:\Users\User\exprt\exprt9.xlsx');
for k=1:numel(sheet_name)
  data9{k}=xlsread('C:\Users\User\exprt\exprt9.xlsx',sheet_name{k});
end
j1=cell2mat(data9(1,1));
j1=j1(1:3, 1)/3600;

j2=cell2mat(data9(1,2));
j2=j2(1:3, 1)/3600;

j3=cell2mat(data9(1,3));
j3=j3(1:3, 1)/3600;

j4=cell2mat(data9(1,4));
j4=j4(1:3, 1)/3600;

j5=cell2mat(data9(1,5));
j5=j5(1:3, 1)/3600;

figure()
jk=bar([j1 j2 j3 j4 j5]', 'stacked'); 

title('Case 4')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 1', 'Optimized Compaction 2', 'Minimum Compaction', 'Maximum Compaction'})
xlabel('Parameter Sets')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')



% Case 5
[~,sheet_name]=xlsfinfo('C:\Users\User\exprt\exprt10.xlsx');
for k=1:numel(sheet_name)
  data10{k}=xlsread('C:\Users\User\exprt\exprt10.xlsx',sheet_name{k});
end
k1=cell2mat(data10(1,1));
k1=k1(1:3, 1)/3600;

k2=cell2mat(data10(1,2));
k2=k2(1:3, 1)/3600;

k3=cell2mat(data10(1,3));
k3=k3(1:3, 1)/3600;

k4=cell2mat(data10(1,4));
k4=k4(1:3, 1)/3600;

k5=cell2mat(data10(1,5));
k5=k5(1:3, 1)/3600;

figure()
kk=bar([k1 k2 k3 k4 k5]', 'stacked'); 

title('Case 5')
legend('Layup Time', 'Out of Ply Time','Debulking Time')
xticklabels({'Benchmark', 'Optimized Compaction 1', 'Optimized Compaction 2', 'Minimum Compaction', 'Maximum Compaction'})
xlabel('Parameter Sets')
set(gca,'XTickLabelRotation',45)
ax = gca;
ax.YAxis.Exponent = 0;
ylabel('AFP Process Time (hours) ')

%% Production Scenario Comparison

figure()
 pl1=plot([sum(g1), sum(h1), sum(i1), sum(j1), sum(k1)],'--gs');
 hold on 
 pl2=plot([sum(g2), sum(h2), sum(i2), sum(j2), sum(k2)],'r-o');
 hold on
 pl3=plot([sum(g3), sum(h3), sum(i3), sum(j3), sum(k3)],'b-*','MarkerSize',10);
 hold on
 pl4=plot([sum(g4), sum(h4), sum(i4), sum(j4), sum(k4)],'k-o');
 hold on 
 pl5=plot([sum(g5), sum(h5), sum(i5), sum(j5), sum(k5)],'y-*');
 hold on 

 grid on
 title('Determination of break-even point')
 legend('Benchmark','Optimized Compaction 1', 'Optimized Compaction 2','Minimum Compaction','Maximized Compaction');
 xlabel('Production Scenarios')
 xticks([1 2 3 4 5])
 xticklabels({'Case 1', 'Case 2', 'Case 3', 'Case 4','Case 5'})
 ax = gca;
 ax.YAxis.Exponent = 0;
 ylabel('AFP Process Time (hours)')
 
