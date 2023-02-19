%求收入最大值的函数
function value= RevenueMixUtility_max_func(price,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec)
len = length(pt_vec);

b=[];%统计每个用户在p=price时的带宽需求
utility = [];
%代入p，计算每个用户在p价格下的带宽大小
for i=1:len
    if price>pt_vec(i)
        f = ut_vec{i}; 
        u = f(price);
        if u>=0
            b(i)=B0_vec(i);
            utility(i)=u;
        else
            b(i)=0; %效用小于0,没有满足要求的带宽
            utility(i)=0;
        end
    else
        %price<=pt_vec(i)
        f = y_vec{i};
        u = f(price);
        if u>=0
            f = bmax_vec{i};
            b(i)=f(price);
            utility(i)=u;
        else
            b(i)=0;
            utility(i)=0;
        end

    end
end

%计算收入
sum_b=sum(b);
R=price*sum_b;
sum_utility = sum(utility);

alpha = 0.43; %占比函数
RevenueMixUtility= (1-alpha)*R+alpha*sum_utility;
value=-RevenueMixUtility;  %要求收入最大值，但遗传算法默认是求最小值，所以要取反

end