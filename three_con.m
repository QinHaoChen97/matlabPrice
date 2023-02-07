function [c,ceq] = zuiyouhuacon(optimInput)
% 示例:
% 将解约束到区域
% x^2 + y^2 <= 5
% x^2 + y^2 >= 2
% y = x^3

% 编辑以下行以添加您的计算方法
% 注意，如果没有不等式约束，请指定 c = []
% 注意，如果没有等式约束，请指定 ceq = []
x1 = optimInput(1);  %x_i为输入的带宽大小
y1 = optimInput(2);  %y_i为对应的价格
x2 = optimInput(3);
y2 = optimInput(4);
x3 = optimInput(5);
y3 = optimInput(6);
c(1) = x1*y1-50;  %50是用户1的预算  x1*y1<=50 -> x1*y1-50<=0
c(2) = x2*y2-100;
c(3) = x3*y3-100;
c(4) = 1-(500/(1+exp(0.5*(50-x1)))-x1*y1);  %用户1要求效用大于1
c(5) = 1-(200/(1+exp(0.5*(60-x1)))-x2*y2);
c(6) = 1-(500/(1+exp(0.5*(20-x1)))-x3*y3);
%ISP自己有保留

ceq = [];
end