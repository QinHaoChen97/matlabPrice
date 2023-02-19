function f = ga_price(p,vec_P)
% 示例:
% 最小化 Rosenbrock 函数
% f = 100*(y - x^2)^2 + (1 - x)^2

% 编辑以下行以添加您的计算方法
x = optimInput(1);
y = optimInput(2);
f = 100*(y - x^2)^2 + (1 - x)^2;
end