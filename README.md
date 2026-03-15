# Esp32_Radar_System
# ESP32 Radar System

This project simulates a radar system using an ESP32 microcontroller, ultrasonic sensor, and servo motor.

## Components Used
- ESP32
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- AA Battery Pack
- Processing Software

## Working Principle
The servo motor rotates the ultrasonic sensor from 0° to 180°.  
At each angle the sensor measures distance and sends the data to a computer.

Processing software reads the serial data and visualizes it as a radar screen.

## Data Format
angle,distance.
Example:
90,25.

## Applications
- Obstacle detection
- Robotics
- Smart surveillance
- Radar simulation for learning

## Author
Rajesh Anand
