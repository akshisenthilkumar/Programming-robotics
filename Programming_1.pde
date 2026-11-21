Robot.java
RobotContainer.java
Constants.java
subsytems/
import com.revrobotics.spark.SparkMax;
import com.revrobotics.spark.SparkLowLevel.MotorType;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
import edu.wpi.first.wpilibj2.command.SubsystemBase;
import com.revrobotics.spark.config.SparkMaxConfig;
import com.revrobotics.spark.SparkBase.PersistMode;
import com.revrobotics.spark.SparkBase.ResetMode;
import edu.wpi.first.math.controller.PIDController;

public class RobotContainer{
  private final DriveSubsystem myDrive = new DriveSubsystem();
  private final Joystick driveStick = new Joystick();
  
  public RobotContainer(){
    default void setDefaultCommand(Command defaultCommand){
   myDrive.arcadeDrive(-driveStick.getY(), -driveStick.getX());
    }
  }
}
public class DriveSubsystem extends SubsystemBase{
   private final SparkMax FrontLeft  = new SparkMax(1, MotorType.kBrushless);
  private final SparkMax FrontRight  = new SparkMax(2, MotorType.kBrushless);
  private final SparkMax RearLeft  = new SparkMax(3, MotorType.kBrushless);
  private final SparkMax RearRight  = new SparkMax(4, MotorType.kBrushless);
  private final DifferentialDrive drive = new DifferentialDrive(FrontLeft, FrontRight);
 
  RearLeftConfig.follow(FrontLeft);
  RearRightConfig.follow(FrontRight);
   SparkMaxConfig RearLeftConfig = new SparkMaxConfig();
  SparkMaxConfig RearRightConfig = new SparkMaxConfig();
 RearLeft.configure(RearLeftConfig, ResetMode.kResetSafeParameters, PersistMode.kPersistParameters);
  RearRight.configure(RearRightConfig, ResetMode.kResetSafeParameters, PersistMode.kPersistParameters);
  drive.setRightSideInverted(true);
public void arcadeDrive(double xSpeed, double zRotation){
  drive.arcadeDrive(xSpeed, zRotation);
  }
}
private final PIDController turnPID = new PIDController(0.1,0,0);

private final ADXRS450_Gyro = new ADXRS450_Gyro();
public Rotation2d getHeading(){
  return gyro.getAngle();
}
Command autonomousCommand = Commands.sequence(
myDrive.arcadeDrive(0.5,0).withTimeout(3.0)
new RunCommand(() -> myDrive.arcadeDrive(0, turnPID.calculate(myDrive.getHeading(), 90)), myDrive)
)

)
