% Define the parameters of the problem
N = 100;             % Number of grid points in each direction
L = 1;               % Length of the domain
h = L/N;             % Grid spacing
x = linspace(0, L, N+1);    % Grid points
y = x;
[X, Y] = meshgrid(x, y);

% Define the boundary conditions
u0 = input('Dirichlet boundary condition at x=0');              % Dirichlet boundary condition at x=0
uL = input('Dirichlet boundary condition at x=L');              % Dirichlet boundary condition at x=L
v0 = input('Dirichlet boundary condition at y=0');              % Dirichlet boundary condition at y=0
vL = input('Dirichlet boundary condition at y=L');              % Dirichlet boundary condition at y=L

% Define the right-hand side of the Poisson equation
f = @(x, y) (x^2 * y);

% Define the solution matrix
U = zeros(N+1, N+1);

% Implement the Finite Difference Method
for k = 1:1000     % Number of iterations
    for i = 2:N
        for j = 2:N
            U(i, j) = (U(i+1,j) + U(i-1,j) + U(i,j+1) + U(i,j-1))/4 - h^2/4*f(x(i),y(j));
        end
    end
    
    % Apply the boundary conditions
    U(1,:) = u0;       % x=0
    U(N+1,:) = uL;     % x=L
    U(:,1) = v0;       % y=0
    U(:,N+1) = vL;     % y=L
end

% Plot the solution
figure;
surf(X, Y, U);
title('Poisson''s Equation Solution');
xlabel('x');
ylabel('y');
zlabel('u');
