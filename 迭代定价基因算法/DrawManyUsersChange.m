clear;
% 指定要读取的Excel文件和范围
filename = '多用户定价数据.xlsx';
sheet = 1;
range = 'A1:k4';

% 读取数据并存储到向量中
data = xlsread(filename);
number = (data(1,:));
price = data(2,:);
revenue = data(3,:);
AverageRevenue = data(4,:);
% figure
% plot(number,price)
% ylim([0,2])
% xticks(number)
% yticks(0:0.3:2)
% xlabel('用户数量')
% ylabel('ISP定价p')
figure
plot(number,AverageRevenue);
ylim([0,100])
xlabel('用户数量')
ylabel('ISP从每个用户处获得的平均收益')