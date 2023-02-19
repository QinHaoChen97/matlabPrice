function [c,ceq] = test_con(optimInput)
% 示例:
% 将解约束到区域
% x^2 + y^2 <= 5
% x^2 + y^2 >= 2
% y = x^3

% 编辑以下行以添加您的计算方法
% 注意，如果没有不等式约束，请指定 c = []
% 注意，如果没有等式约束，请指定 ceq = []
x1 = optimInput(1);  %x_i为输入的带宽大小
x2 = optimInput(2);
price = optimInput(3);  %y_i为对应的价格
% c(1) =y1-5;  %应修改为每单位的最大价格
% c(2) =y2-5;
c(1) = -value(80,0.5,50,x1,price);  %value(C1,C2,U0,bi,p)
c(2) = -value(40,0.5,50,x2,price);

end