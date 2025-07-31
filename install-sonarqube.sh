# Update and install Java
sudo apt update -y
sudo apt install openjdk-17-jdk -y

# Create a sonar user
sudo adduser --system --no-create-home --group --disabled-login sonar

# Download and extract SonarQube
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.4.1.88267.zip
sudo apt install unzip -y
sudo unzip sonarqube-10.4.1.88267.zip
sudo mv sonarqube-10.4.1.88267 sonarqube

# Set permissions
sudo chown -R sonar:sonar /opt/sonarqube

# Set system settings required by SonarQube
sudo sysctl -w vm.max_map_count=262144

# Switch to sonar user and start SonarQube
sudo su - sonar
cd /opt/sonarqube/bin/linux-x86-64
./sonar.sh start
