%通过暴力迭代的方法来搜索使R最大的p的值
clear;

syms p C1 C2 B0
%当p<=pt时u的最大值
u_bmax=(2*p*log(-(2*p - C1*C2 + C1*C2*sqrt(-(4*p - C1*C2)/(C1*C2)))/(2*p)) + C1*C2 - 2*B0*C2*p + C1*C2*sqrt(-(4*p - C1*C2)/(C1*C2)))/(2*C2);
b_max=B0 - log(-(2*p - C1*C2 + C1*C2*sqrt(-(4*p - C1*C2)/(C1*C2)))/(2*p))/C2;  %在p<=pt时时有意义
%pt的表达式
pt=C1*C2/4;
%当p>pt时，只会取B0点，此时只会的效用为
ut=C1/2-p*B0;

C1_vec = [80,100,120,140,180]; %C1_vec(i)为第i个用户的C1参数,C2_vec,B0_vec同理
C2_vec = [0.5,0.5,0.5,0.5,0.5];
B0_vec = [40,40,40,40,40];
C1_len = length(C1_vec);
C2_len = length(C2_vec);
B0_len = length(B0_vec);
if C1_len~=C2_len  || C1_len~=B0_len
    fprintf("输入参数的数量不一致")
end

pt_vec = [];  %pt_vec(i)表示用户i的pt值
ut_vec =cell(1); %ut_vec(i)表示用户i在p>pt时在满意点B0的效用计算公式（当p>pt，满意点收缩到只剩B0一个点）
y_vec=cell(1);  %y_vec(i)表示用户i在 p<=pt 时在满意区间[B0,+inf]最大值的计算公式
bmax_vec=cell(1); %bmax_vec(i)表示用户i 在p<pt时的最大值所对应的带宽值bmax
%生成各个向量
for i=1:C1_len
    tem_pt=subs(pt,[C1,C2],[C1_vec(i),C2_vec(i)]);
    pt_vec=[pt_vec,tem_pt];
    tem_ut=subs(ut,[C1,B0],[C1_vec(i),B0_vec(i)]);
    ut_vec{i}=matlabFunction(tem_ut);
    tem_y = subs(u_bmax,[C1,C2,B0],[C1_vec(i),C2_vec(i),B0_vec(i)]);
    y_vec{i}=matlabFunction(tem_y);
    tem_bmax=subs(b_max,[C1,C2,B0],[C1_vec(i),C2_vec(i),B0_vec(i)]);
    bmax_vec{i} = matlabFunction(tem_bmax);
end

price = 0:0.01:4;
R = [];
bandwidth=[];  %列数为len
%计算在价格p时用户的带宽
for i=price
    [Revenue,b] = Revenue_max_funcWithBandwidth(i,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec);
    R = [R,-Revenue];
    bandwidth=[bandwidth;b];
end
sumBandwidth = sum(bandwidth,2); %按每一行求和，及得出每一行的总带宽
[R_max,index] = max(R);
p_suitable = price(index);
figure;
hold on
yyaxis left;
%plot(price,sumBandwidth,'-','MarkerSize',3,'Color','#0072BD');
plot(price,bandwidth(:,1),'r--');
plot(price,bandwidth(:,2),'g--');
plot(price,bandwidth(:,3),'b--');
plot(price,bandwidth(:,4),'c--');
plot(price,bandwidth(:,5),'m--');
xlabel('Price')
ylabel('Bandwidth')
yyaxis right;
plot(price,R,'-*','Color','#D95319');
ylabel('Revenue')
user1 = strcat('用户1带宽   ','C1=',string(C1_vec(1)),',C2=',string(C2_vec(1)),',B0=',string(B0_vec(1)));
user2 = strcat('用户2带宽   ','C1='+string(C1_vec(2)),',C2='+string(C2_vec(2)),',B0=',string(B0_vec(2)));
user3 = strcat('用户3带宽   ','C1='+string(C1_vec(3)),',C2='+string(C2_vec(3)),',B0=',string(B0_vec(3)));
user4 = strcat('用户4带宽   ','C1='+string(C1_vec(4)),',C2='+string(C2_vec(4)),',B0=',string(B0_vec(4)));
user5 = strcat('用户5带宽   ','C1='+string(C1_vec(5)),',C2='+string(C2_vec(5)),',B0=',string(B0_vec(5)));
%legend('当前出价总带宽',user1,user2,user3,user4,user5,'Revenue');
legend(user1,user2,user3,user4,user5,'Revenue');
title("不同的C2对用户和定价的影响");
hold off

