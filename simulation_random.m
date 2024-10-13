endEffectorPositions = [];

numPoints = 5000;

hWaitbar = waitbar(0, 'Calculating End Effector Positions...');

figure;
hold on;
xlabel('X Position');
ylabel('Y Position');
zlabel('Z Position');
title('End Effector Positions from Forward Kinematics');
grid on;
axis equal;

for i = 1:numPoints
    theta1 = rand() * 180;  % Random angle between 0 and 180 degrees
    theta2 = rand() * 360;  % Random angle between 0 and 360 degrees
    theta3 = rand() * 360;  % Random angle between 0 and 360 degrees
    
    theta = [theta1, theta2, theta3];

    T_matrix = forwardKinematics(theta, 'd');

    position = T_matrix(1:3, 4);

    endEffectorPositions = [endEffectorPositions; position'];

    plot3(position(1), position(2), position(3), 'ro');
    drawnow;

    waitbar(i / numPoints, hWaitbar);
end

close(hWaitbar);
