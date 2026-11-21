Robot.java
RobotContainer.java
Constants.java

import com.revrobotics.spark.SparkMax;
import com.revrobotics.spark.SparkLowLevel.MotorType;
import edu.wpi.first.wpilibj2.command.SubsystemBase;

public class RobotContainer{
    private final Joystick driveStick = new Joystick(0);
    private final ClimberSubsystem climber = new ClimberSubsystem();
    public RobotContainer()
    new JoystickButton(driveStick, 1)
    .whileTrue(new RunCommand(() -> climber.raiseClimber() climber));
    .finallyDo(climber.stopClimber());
    new JoystickButton(driveStick, 2)
    .whileTrue(new RunCommand(() -> climber.lowerClimber(), climber));
    .finallyDo(climber.stopClimber());
    }

}

public class ClimberSubsystem extends SubsystemBase{
private final SparkMax one  = new SparkMax(1, MotorType.kBrushless);
private final SparkMax two  = new SparkMax(2, MotorType.kBrushless);

public ClimberSubsystem(){
  
}
public void raiseClimber(){
  one.set(0.5);
  two.set(0.5);
}

public void lowerClimber(){
  one.set(-0.5);
  two.set(-0.5);
}
public void stopClimber(){
  one.set(0);
  two.set(0);
}

}
