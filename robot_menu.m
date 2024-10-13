% Main menu
exit_menu = false;


while ~exit_menu
    main_choice = menu('Main Menu', ...
        'View Robot', ...
        'View Robot at Different Joint Angles', ...
        'Cook Own Workspace', ...
        'Load from CSV Workspace', ...
        'Test Forward Kinematics', ...
        'Test Inverse Kinematics', ...
        'Exit');

    switch main_choice
        case 1
            createrobot
            
        case 2
            angle1 = input('Enter angle 1 in degree: ');
            angle2 = input('Enter angle 2 in degree: ');
            angle3 = input('Enter angle 3 in degree: ');
            
            theta = [angle1, angle2, angle3];
            createrobot(theta, 'd');
            
        case 3
            workspace_choice = menu('Cook Own Workspace', ...
                'Random Plot', ...
                'Sequential Plot');
            
            switch workspace_choice
                case 1
                    disp('You chose Random Plot for Own Workspace.');
                    simulation_random
                    
                case 2
                    disp('You chose Sequential Plot for Own Workspace.');
                    simulation_sequential
                    
                otherwise
                    disp('No plot option was selected.');
            end
            
        case 4
            csv_choice = menu('Load from CSV Workspace', ...
                'Random Plot', ...
                'Sequential Plot');
            
            switch csv_choice
                case 1
                    disp('You chose Random Plot from CSV Workspace.');
                    filePath = 'end_effector_positions_random.csv';

                    data = readmatrix(filePath);

                    x = data(:, 1);
                    y = data(:, 2);
                    z = data(:, 3);

                    figure;
                    scatter3(x, y, z, 'filled');
                    xlabel('X');
                    ylabel('Y');
                    zlabel('Z');
                    title('3D Plot of XYZ Points');

                    axis equal;
                    
                case 2
                    disp('You chose Sequential Plot from CSV Workspace.');
                    filePath = 'end_effector_positions.csv';

                    data = readmatrix(filePath);

                    x = data(:, 1);
                    y = data(:, 2);
                    z = data(:, 3);

                    figure;
                    scatter3(x, y, z, 'filled');
                    xlabel('X');
                    ylabel('Y');
                    zlabel('Z');
                    title('3D Plot of XYZ Points');

                    axis equal;
                    
                otherwise
                    disp('No plot option was selected.');
            end
        case 5
            angle1 = input('Enter angle 1 in degree: ');
            angle2 = input('Enter angle 2 in degree: ');
            angle3 = input('Enter angle 3 in degree: ');
            
            theta = [angle1, angle2, angle3]; 
            T_matrix = forwardKinematics(theta, 'd');
            disp(T_matrix);
        case 6
            % L = [4, 1, 1];

            x = input('Enter x: ');
            y = input('Enter y: ');
            z = input('Enter z: ');

            r = createrobot(theta, 'd');

            joint_angles = inverseKinematics(r,[x, y, z]);

            disp('Joint Angles (radians):');
            disp(joint_angles);
        
        case 7
            disp('Exiting the program...');
            exit_menu = true;
    
            
        otherwise
            disp('No valid option was selected.');
    end
end