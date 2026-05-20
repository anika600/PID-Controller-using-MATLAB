# PID Controller Design using Ziegler-Nichols Tuning Method

This MATLAB repository demonstrates the design and analysis of **Proportional (P)**, **Proportional-Integral (PI)**, and **Proportional-Integral-Derivative (PID)** controllers for a third-order continuous-time system. 

The controller parameters are automatically calculated using the classic **Ziegler-Nichols (Z-N) closed-loop tuning method** based on the system's frequency response margins.

---

## 📌 System Description

The plant model used in this simulation is a third-order transfer function defined as:

$$G(s) = \frac{5}{(s+2)(s+4)(s+6)} = \frac{5}{s^3 + 12s^2 + 44s + 48}$$

The script dynamically determines the system's stability margins to extract the **Ultimate Gain ($K_u$)** and **Ultimate Period ($P_u$)** required for the tuning formulas.

---

## 🛠️ Ziegler-Nichols Tuning Parameters

The script applies the traditional Z-N rules to calculate the controller gains:

| Controller Type | $K_p$ | $T_i$ | $T_d$ |
| :--- | :--- | :--- | :--- |
| **Proportional (P)** | $0.5 \cdot K_u$ | $-$ | $-$ |
| **Proportional-Integral (PI)** | $0.45 \cdot K_u$ | $P_u / 1.2$ | $-$ |
| **Proportional-Derivative-Integral (PID)** | $0.6 \cdot K_u$ | $P_u / 2$ | $P_u / 8$ |

---

## 🚀 How to Run the Project

### Prerequisites
* MATLAB (R2018a or newer recommended)
* Control System Toolbox

### Execution Steps
1. Clone this repository or download the `PIDcontroller.m` file.
2. Open MATLAB and navigate to the directory containing the file.
3. Run the script by typing `PIDcontroller` in the Command Window, or press **Run (F5)** in the MATLAB Editor.

---

## 📊 Performance & Outputs

### 1. Command Window Metrics
When executed, the script outputs the critical frequency-domain metrics derived from the plant's uncompensated open-loop response:
* **Ultimate Gain ($K_u$):** The gain margin threshold where the system becomes marginally stable.
* **Oscillation Frequency ($\omega_u$):** The phase crossover frequency in rad/s.

### 2. Step Response Comparison
The script simulates a unit step input to compare how each controller manages transient and steady-state behaviors:


* **Proportional Only (P):** Fast response but suffers from a significant steady-state offset.
* **Proportional-Integral (PI):** Eliminates the steady-state error entirely, but introduces heavy oscillations and high overshoot.
* **Proportional-Integral-Derivative (PID):** Provides the optimal balance—eliminating steady-state error, dampening the system to reduce overshoot, and drastically improving settling time.

---

## 📁 Repository Structure

* `PIDcontroller.m` - Main MATLAB script containing the plant definition, Z-N tuning formulas, closed-loop feedback loops, and plotting commands.
*  - Scope plot showing the step response comparison.
* `README.md` - Documentation of the project.

---

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).
