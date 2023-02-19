C1_1=200;C1_2=400;
C2_1=0.5;C2_2=0.5;
B0_1=50;B0_2=50;
syms b1 b2 p1 p2
y1=C1_1/(1+exp(C2_1*(B0_1-b1)))-b1*p1;
y2=C1_2/(1+exp(C2_2*(B0_2-b2)))-b2*p2;
y11=diff(y1,b1);
y22=diff(y2,b2);
price = 0.1; %初始值
Y1 = subs(y11,p1,price);
B1 = solve(Y1,b1);
Y2 = subs(y22,p2,price);
B2 = solve(Y2,b2);
if subs(y1,[b1,p1],[B1(1),price])>subs(y1,[b1,p1],[B1(2),price])
    B1=B1(1);
else
    B1=B1(2);
end
if subs(y2,[b2,p2],[B2(1),price])>subs(y2,[b2,p2],[B2(2),price])
    B2=B2(1);
else
    B2=B2(2);
end
if subs(y1,[b1,p1],[B1,price])<0 %用户效用过低
    B1=0;
end
if subs(y1,[b1,p1],[B2,price])<0
    B2=0;
end
B1_trace = [];  %记录B1的历史记录值
B2_trace = [];  %记录B2的历史记录值
p_trace = []; %记录历史出价
pmax_trace = []; %当前迭代时有最大利润的出价
R_trace = [];
R = price*(B1+B2);
Rmax = R;
pmax=price;
B1_trace=[B1_trace,B1];
B2_trace=[B2_trace,B2];
p_trace = [p_trace,price];
pmax_trace = [pmax_trace,pmax];
R_trace = [R_trace,R];
while B1<0.0001 || B2>0.0001
    price=price+0.1;
    Y1 = subs(y11,p1,price);
    B1 = solve(Y1,b1);
    Y2 = subs(y22,p2,price);
    B2 = solve(Y2,b2);
    if subs(y1,[b1,p1],[B1(1),price])>subs(y1,[b1,p1],[B1(2),price])
        B1=B1(1);
    else
        B1=B1(2);
    end
    if subs(y2,[b2,p2],[B2(1),price])>subs(y2,[b2,p2],[B2(2),price])
        B2=B2(1);
    else
        B2=B2(2);
    end
    if subs(y1,[b1,p1],[B1,price])<0
        B1=0;
    end
    if subs(y1,[b1,p1],[B2,price])<0
        B2=0;
    end
    R = price*(B1+B2);
    if R>Rmax
        Rmax=R;
        pmax=price;
    end
    B1_trace=[B1_trace,B1];
    B2_trace=[B2_trace,B2];
    p_trace = [p_trace,price];
    pmax_trace = [pmax_trace,pmax];
    R_trace = [R_trace,R];
end
plot(p_trace,R_trace);
