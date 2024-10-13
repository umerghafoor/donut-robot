function robot = createrobot(theta, unit)
    % 3 joint revolute robot
    
    % Default values
    if nargin < 1 
        theta = [0, 0, 0];  
    elseif length(theta) ~= 3
        error('theta must be a 3-element vector representing joint angles.');
    end

    if nargin < 2
        unit = 'r';
    end
    
    % Link 1: [theta1, d=0, a=4, alpha=pi/2] with limits [0, 180 degrees]
    % Link 2: [theta2, d=0, a=1, alpha=0]
    % Link 3: [theta3, d=0, a=1, alpha=0]

    L(1) = Link([0 0 4 pi/2 0], 'standard');
    L(2) = Link([0 0 1 0 0], 'standard');
    L(3) = Link([0 0 1 0 0], 'standard');
    

    L(1).qlim = [0, pi];
    
    if strcmpi(unit, 'd')
        theta = deg2rad(theta);
    elseif ~strcmpi(unit, 'r')
        error('Unit must be either "degrees (d)" or "radians (r)".');
    end
    
    robot = SerialLink([L(1) L(2) L(3)], 'name', 'Donut Robot');
    
    robot.plot(theta);
    
    robot.teach(theta);
end
