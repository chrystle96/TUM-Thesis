%% Graph Analysis Y: AXIS
% Benchmark
bench_1=sum(g1);
bench_2=sum(h1);
bench_3=sum(i1);
bench_4=sum(j1);
bench_5=sum(k1);
benchmark=[bench_1 bench_2 bench_3 bench_4 bench_5];
% Optimized Compaction 1
optc1_1=sum(g2);
optc1_2=sum(h2);
optc1_3=sum(i2);
optc1_4=sum(j2);
optc1_5=sum(k2);
opt_comp1=[optc1_1 optc1_2 optc1_3 optc1_4 optc1_5];
% Optimized Compaction 2
optc2_1=sum(g3);
optc2_2=sum(h3);
optc2_3=sum(i3);
optc2_4=sum(j3);
optc2_5=sum(k3);
opt_comp2=[optc2_1 optc2_2 optc2_3 optc2_4 optc2_5];
% Minimized Compaction
min_1=sum(g4);
min_2=sum(h4);
min_3=sum(i4);
min_4=sum(j4);
min_5=sum(k4);
min_comp=[min_1 min_2 min_3 min_4 min_5];
% Maximized Compaction
max_1=sum(g5);
max_2=sum(h5);
max_3=sum(i5);
max_4=sum(j5);
max_5=sum(k5);
max_comp=[max_1 max_2 max_3 max_4 max_5];
%% X: Axis
x1=31500000;
x2=105000000;
x3=420000000;
x4=1050000000;
x5=2362500000;
x_cord=[x1 x2 x3 x4 x5];
%% PLOT
plot(x_cord/(10^9), benchmark,'g--');
hold on 
plot(x_cord/(10^9), opt_comp1,'r--')
hold on 
plot(x_cord/(10^9), opt_comp2,'b--');
hold on
plot(x_cord/(10^9), min_comp,'k--')
hold on
plot(x_cord/(10^9), max_comp,'y-')
hold on
title('AFP layup time in terms of total area of layup')
xlabel('Total Areas, 10^9 (sq.mm)')
ylabel('AFP Layup Time (hours)')
legend('Benchmark','Optimized Compaction 1','Optimized Compaction 2','Minimized Compaction', 'Maximum Compaction')

figure()
[x0,y0]=intersections(x_cord/(10^9), benchmark, x_cord/(10^9), opt_comp2);
grid on 
legend('Benchmark', 'Optimized Model 2')
title('Comparison of the Optimized model 2 with the benchmark')
xlabel('Total Areas, 10^9 (sq.mm)')   
ylabel('AFP Layup Time (hours)')

%% Benchmark and Model 1 Intercepts
N=linspace(1,10e9,4);
X= interp1(x_cord,opt_comp1,N,'linear','extrap');
figure()
plot(N, X, '--r')
hold on
plot(x_cord, opt_comp1)
title('Linear Extrapolation')
xlabel('Total Areas (sq.mm)') 
ylabel('AFP Layup Time (hours)')

hold off
grid
N=linspace(1,10e9,4);
Y= interp1(x_cord,benchmark,N,'linear','extrap');
figure()
plot(N, Y, '--g')
xlabel('Total Areas (sq.mm)')   
ylabel('AFP Layup Time (hours)')
hold on
plot(x_cord, benchmark)
title('Linear Extrapolation')
xlabel('Total Areas (sq.mm)')   
ylabel('AFP Layup Time (hours)')
hold off
grid on

% Redefine x cordinates
x6= 10e9;
x_cord1=[x1 x2 x3 x4 x5 x6];
y_1=[bench_1 bench_2 bench_3 bench_4 bench_5 Y(4)];
y_2=[opt_comp1, X(4)];
figure()
[x_int,y_int]=intersections(x_cord1/(1e9),y_1, x_cord1/(1e9),y_2);
grid on 
title('Comparison of the Optimized model 1 with the benchmark')
legend('Benchmark', 'Optimized Model 1')
xlabel('Total Areas, 10^9 (sq.mm)')   
ylabel('AFP Layup Time (hours)')


