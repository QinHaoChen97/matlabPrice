%求效用最大值的函数
function value= Utility_max_func(price,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec)
len = length(pt_vec);

utility=[];%统计用户的效用

%代入p，计算每个用户在p价格下的效用
for i=1:len
    if price>pt_vec(i)  %此时带宽只选择B0或0
        f = ut_vec{i}; 
        u = f(price);
        if u>=0
            utility(i)=u;
        else
            utility(i)=0; %效用小于0,没有满足要求的带宽
        end
    else
        %price<=pt_vec(i)
        f = y_vec{i};
        u = f(price);
        if u>=0
            utility(i)=u;
        else
            utility(i)=0;
        end

    end
end

%计算收入
sum_utility=sum(utility);
value=-sum_utility;  %要求收入最大值，但遗传算法默认是求最小值，所以要取反



end