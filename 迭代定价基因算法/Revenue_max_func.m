%求收入最大值的函数
function value= Revenue_max_funcWithBandwidth(price,pt_vec,ut_vec,y_vec,B0_vec,bmax_vec)
len = length(pt_vec);

b=[];%统计每个用户在p=price时的带宽需求

%代入p，计算每个用户在p价格下的带宽大小
for i=1:len
    if price>pt_vec(i)
        f = ut_vec{i}; 
        u = f(price);
        if u>=0
            b(i)=B0_vec(i);
        else
            b(i)=0; %效用小于0,没有满足要求的带宽
        end
    else
        %price<=pt_vec(i)
        f = y_vec{i};
        u = f(price);
        if u>=0
            f = bmax_vec{i};
            b(i)=f(price);
        else
            b(i)=0;
        end

    end
end

%计算收入
sum_b=sum(b);
R=price*sum_b;
value=-R;  %要求收入最大值，但遗传算法默认是求最小值，所以要取反



end