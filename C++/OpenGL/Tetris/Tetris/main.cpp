//
//  main.cpp
//  Tetris
//
//  Created by Aoikazto on 2020/01/19.
//  Copyright © 2020 Aoikazto. All rights reserved.
//

#define GL_SILENCE_DEPRECATION

#include <iostream>
#include <GLUT/GLUT.h>

void display()
{
    glClear(GL_COLOR_BUFFER_BIT);
    
    glPointSize(10);
    glBegin(GL_TRIANGLES);
    glVertex2d(-0.5, 0.5);
    glVertex2d(0.5, 0.5);
    glVertex2d(0, -0.5);
    glEnd();

    glFlush();
    
}

int main(int argc, char * argv[]) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutCreateWindow("OpenGL");
    glutDisplayFunc(display);
//    DoInit();
    glutMainLoop();
    
    return 0;
}
