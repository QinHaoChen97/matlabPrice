function f = zuiyouhuafunc(optimInput)
% 示例:
% 最小化 Rosenbrock 函数
% f = 100*(y - x^2)^2 + (1 - x)^2

% 编辑以下行以添加您的计算方法
x1 = optimInput(1);  %x_i为输入的带宽大小
y1 = optimInput(2);  %y_i为对应的价格
x2 = optimInput(3);
y2 = optimInput(4);
x3 = optimInput(5);
y3 = optimInput(6);
f = -(x1*y1+x2*y2+x3*y3);
end