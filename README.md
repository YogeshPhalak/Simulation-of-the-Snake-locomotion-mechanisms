# Simulation-of-the-Snake-locomotion-mechanisms
(Implementation of Snake locomotion mechanisms on the derived Simplified Kinematical Model of discrete Snake Robot in MATLAB.)


## Introduction

Snakes use at least five unique modes of terrestrial locomotion. The kind of locomotion a snake uses in any particular instance depends on several factors such as the kind of surface it is crawling on and its speed. 

An elegant way to express gaits for a snake robot is the gait equation, which expresses joint angles as a function of the joint index and the phase of the gait cycle. The general gait equation of snake movements can be expressed as,

<img src="/Media/general_Gait_equation.PNG" height="70" />

Where, *n* is the joint index. *A*<sub>*x*</sub>, *A*<sub>*y*</sub> represent the amplitudes; *δ*<sub>*x*</sub> *δ*<sub>*y*</sub> represents the spatial frequency; *ω*<sub>*x*</sub>, *ω*<sub>*y*</sub> represent the temporal frequency and *ϕ* represents the phase difference between the sine waves in horizontal and vertical plane.

### Lateral Undulation (Serpentine Movement) 

Lateral Undulation is the common serpentine locomotion of snakes. In lateral undulation, as in simple undulation, waves of lateral bending are propagated along the body from head to tail.

<img src="https://latex.codecogs.com/gif.latex?%5Ctextbf%7BGait%7Eequation%3A%7D%7E%7E%5Ctheta%28t%29%3D%20%5Cfrac%7Ba%5Cpi%7D%7B40%7D%5Ctimes%5Csin%5Cleft%20%5C%28%5Cfrac%7B4%5Cpi%7D%7B41%7D%5Ctimes%20t%5Cright%5C%29&plus;%5Cphi" />

(a = 3.5, *ϕ* = 0<sup>*r*</sup>)
