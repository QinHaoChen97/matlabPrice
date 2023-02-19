function value = value(C1,C2,U0,bi,p)
%U 此处显示有关此函数的摘要
%   此处显示详细说明

    value=C1./(1+exp(C2*(U0-bi)))-bi.*p;
end

