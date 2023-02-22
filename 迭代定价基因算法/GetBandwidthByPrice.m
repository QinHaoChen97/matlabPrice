%区分定价求收入最大值的函数
function [thing,items,utility]= GetBandwidthByPrice(price,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec,C)
if length(price) ~= length(pt_vec)
    throw(MException("生成的参数数量不一致"));
end
len = length(price);
thing=[];%统计每个用户在p=price时的带宽需求
utility=[];
%代入p，计算每个用户在p价格下的带宽大小
for i=1:len
    if price(i)>pt_vec(i)
        f = ut_vec{i}; 
        u = f(price(i));
        utility(i) = u;
        if u>=0
            thing(i)=B0_vec(i);
        else
            thing(i)=0; %效用小于0,没有满足要求的带宽
        end
    else
        %price<=pt_vec(i)
        f = y_vec{i};
        u = f(price(i));
        utility(i) = u;
        if u>=0
            f = bmax_vec{i};
            thing(i)=f(price(i));
        else
            thing(i)=0;
        end

    end
end

if length(price) ~= length(thing)
    throw(MException("生成的参数数量不一致"));
end

pay_vec=[];
for i=1:length(price)
    pay_vec(i)=thing(i)*price(i);
end

%背包算法求最大值
[max_value, items]=backtracking_knapsack(C,thing,pay_vec);


end