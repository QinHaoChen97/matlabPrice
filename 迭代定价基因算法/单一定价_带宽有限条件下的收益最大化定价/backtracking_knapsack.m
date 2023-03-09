function [max_value, items] = backtracking_knapsack(C, thing, value)
n = length(thing); % 物品数量

% 初始化最大价值和当前价值、物品向量
max_value = 0;
current_value = 0;
items = zeros(1, n);

% 递归函数，搜索所有可能的选择方案,不用动态规划是因为有小数
    function search(idx, remaining_capacity,n,C,thing,value)
    % 如果已经遍历了所有物品，返回
    if idx > n
        % 如果当前价值比最大价值更高，更新最大价值和选择的物品
        if current_value > max_value
            max_value = current_value;
            items = candidate_items;
        end
        return
    end
    % 不选第i个物品
    candidate_items(idx) = 0;
    search(idx + 1, remaining_capacity,n,C,thing,value);
    % 如果剩余容量足够选择第i个物品，可以选择它
    if thing(idx) <= remaining_capacity
        candidate_items(idx) = 1;
        current_value = current_value + value(idx);
        search(idx + 1, remaining_capacity - thing(idx),n,C,thing,value);
        % 恢复状态
        candidate_items(idx) = 0;
        current_value = current_value - value(idx);
    end
end

% 候选物品向量
candidate_items = zeros(1, n);

% 开始搜索
search(1, C,n,C,thing,value);

end
