%带宽C有限下求收入最大化
function answer= LimitCapitalMaxRevenue_func(price,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec,C)
if length(price) ~= 1
    throw(MException("不是统一定价"));
end
len = length(pt_vec);
thing=[];%统计每个用户在p=price时的带宽需求
%代入p，计算每个用户在p价格下的带宽大小
for i=1:len
    if price>pt_vec(i)
        f = ut_vec{i}; 
        u = f(price);
        if u>=0
            thing(i)=B0_vec(i);
        else
            thing(i)=0; %效用小于0,没有满足要求的带宽
        end
    else
        %price<=pt_vec(i)
        f = y_vec{i};
        u = f(price);
        if u>=0
            bandwidth_func = bmax_vec{i};
            thing(i)=bandwidth_func(price);
        else
            thing(i)=0;
        end

    end
end

value=[]; %当前价格每个用户能带来的收益
for i=1:len
    value(i)=thing(i)*price;
end

%背包算法求最大值
[max_value, items]=backtracking_knapsack(C,thing,value);
answer=-max_value;  %要求收入最大值，但遗传算法默认是求最小值，所以要取反



end