# The Donut Robot

## **Idea**

![blue print][image7]

### Why This Robot?

This robot configuration is better because it covers all the workspace with minimal constraints, or in other words, no constraints if it were a full donut. There is no need to passively apply constraints on it; it covers all areas of the donut by default.

#### Other ideas

Using a prismatic joint instead of a revolute joint at last place but that could leave blind spot in the exact middle of the donut.

Using a puma like robot but passively defining workspace but that could cause resource wastage since we have to define the constraints after the calculation inverse kinematics.

#### Issues in my design

Exact middle of the donut is unreachable since it has joints at that place. This issue can be solved by moving joint away from the robot but still maintaining the pivot at the same point

The main arm that is attached to the first joint has to travel through the donut and has no path other than that. However, this problem does not affect the efficiency of the workspace; it could cause issues if there is an obstacle in the workspace.

## **Robot**

![robot 1][image1]![robot 2][image2]![robot 3][image4]

## **Frame Assignment**

![robot frames][image9]

## **DH Table**

|  | 𝝧 (Theeta) | d | 𝜶 | a |
| :---- | :---- | :---- | :---- | :---- |
| 1 | 𝝧1 | 0 | 𝝿/2 | 4 |
| 2 | 𝝧2 | 0 | 0 | 1 |
| 3 | 𝝧3 | 0 | 0 | 1 |

### Limitations

* 𝝧1 can have values between 0 and 180  (0\<𝝧1\>180)

## **Plots and Visualization**

### Using Random value

First, I plotted the data for up to 5000 iterations and mapped the end-effector coordinates. This provided a clearer understanding of the workspace, as it demonstrated a more even distribution of points across the XYZ plane.

![random plot top][image11]![random plot][image5]

### Using uniform iterations

Next, I plotted the data points using values at fixed intervals. This diagram offered a more accurate representation of the workspace, providing clearer insight into its structure.To achieve this, I used three nested loops, plotting a total of 25x25x50 points. This method allowed for a precise and thorough visualisation of the workspace.

![sequential plot top][image10]![sequential plot][image8]

### Both methods with density using colours (36,250 data points)

![workspace][image6]

#### Takeaways

* The visualisation confirmed that the half donut-shaped workspace is filled.  
* The density or probability of points is higher at the centre of the donut compared to the edges.  This means that the robot is more sensitive to movement away from the centre and less sensitive to movement when it is in the middle.

## **Code**

**createRobot:** This function initialises and creates the robot model.

**forwardKinematics:** This function calculates the robot's pose, including both rotation and translation.

**inverseKinematics:** This function returns the possible joint angles of the robot for a given XYZ position. Orientation is optional.

**simulation\_random:** This Script simulates the robot's movement in a random manner.

**simulation\_sequential:** This Script simulates the robot's movement in a sequential manner.

[image7]: images/image7.png
[image1]: images/image1.png
[image2]: images/image2.png
[image4]: images/image4.png
[image5]: images/image5.png
[image6]: images/image6.png
[image8]: images/image8.png
[image9]: images/image9.png
[image10]: images/image10.png
[image11]: images/image11.png
