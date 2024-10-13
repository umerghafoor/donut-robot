function pose = returnspecificpose(theta, unit)
    % Default values
    if nargin < 1
        theta = [0, 0, 0];  
    elseif length(theta) ~= 3  
        error('theta must be a 3-element vector representing joint angles.');
    end

    if nargin < 2  
        unit = 'r';
    end
    
    if strcmpi(unit, 'd')
        theta = deg2rad(theta); 
    elseif ~strcmpi(unit, 'r')
        error('Unit must be either "degrees (d)" or "radians (r)".');
    end

    
    % Link 1: [theta1, d=0, a=4, alpha=pi/2]
    % Link 2: [theta2, d=0, a=1, alpha=0]
    % Link 3: [theta3, d=0, a=1, alpha=0]

    L(1) = Link([theta(1) 0 4 pi/2 0], 'standard');  
    L(2) = Link([theta(2) 0 1 0 0], 'standard');     
    L(3) = Link([theta(3) 0 1 0 0], 'standard');    
    robot = SerialLink([L(1) L(2) L(3)], 'name', '3-DOF Revolute Robot');
    
    T = robot.fkine(theta);

    t = T.t;   % Translation vector
    R = T.R;   % Rotation matrix
    
    T_matrix = [R, t; 0 0 0 1];

    pose = struct('position', t, 'orientation', R, 'T_matrix', T_matrix);
end
