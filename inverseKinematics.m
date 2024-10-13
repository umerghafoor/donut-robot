function joint_angles = inverseKinematics(robot, target_position, target_orientation)
    % Default values
    if nargin < 3
        target_orientation = [0, 0, 0];  % Default orientation (roll, pitch, yaw)
    end
    
    R = eul2rotm(target_orientation);
    T = [R, target_position(:); 0, 0, 0, 1];
    
    % Calculate joint angles using inverse kinematics
    joint_angles = robot.ikine(T, 'mask', [1, 1, 1, 0, 0, 0], 'q0', zeros(1, 3));
    
    % Check if the solution is valid
    if isempty(joint_angles)
        disp('No valid joint angles found for the given target position and orientation.');
    end
end
