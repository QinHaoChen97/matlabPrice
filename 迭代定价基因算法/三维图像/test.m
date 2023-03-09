syms b_i p E_i r_i B_i
U_pure1=E_i/(1+exp(r_i*(B_i-b_i)))-p.*b_i%用户的纯效用
U_pure1=subs(U_pure1,[B_i,b_i,r_i],[40,50,1])
x = linspace(-2,2,50);
y = linspace(-2,2,50);
[X,Y] = meshgrid(x,y);
Z = X.^2 + Y.^2;

colormap jet;
surf(X,Y,Z);
colorbar;
