%% Optimization problem
figure()
op=plot(x_cord/(10^9), benchmark,'g--');
title('AFP layup time in terms of total area of layup')
xlabel('Total Areas, 10^9 (sq.mm)')
ylabel('AFP Layup Time (hours)')
legend('Benchmark')
x_op=get(op,'Xdata');
y_op=get(op,'Ydata');
wanted_x = 0 :0.0001: 2.3625;
wanted_y = interp1(x_op, y_op, wanted_x);
figure()
plot(wanted_x, wanted_y )
