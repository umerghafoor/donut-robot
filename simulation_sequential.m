endEffectorPositions = [];

theta1_range = linspace(0, 180, 50);
theta2_range = linspace(0, 360, 25);
theta3_range = linspace(0, 360, 25);

totalIterations = length(theta1_range) * length(theta2_range) * length(theta3_range);

hWaitbar = waitbar(0, 'Calculating End Effector Positions...');

figure;
hold on;
xlabel('X Position');
ylabel('Y Position');
zlabel('Z Position');
title('End Effector Positions from Forward Kinematics');
grid on;
axis equal;

iterationCount = 0;
for theta1 = theta1_range
    for theta2 = theta2_range
        for theta3 = theta3_range
            theta = [theta1, theta2, theta3];

            T_matrix = forwardKinematics(theta, 'd');

            position = T_matrix(1:3, 4);

            endEffectorPositions = [endEffectorPositions; position'];

            plot3(position(1), position(2), position(3), 'ro');
            drawnow;

            iterationCount = iterationCount + 1;
            waitbar(iterationCount / totalIterations, hWaitbar);
        end
    end
end

close(hWaitbar);
