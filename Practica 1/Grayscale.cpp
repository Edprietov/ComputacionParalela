// C++ program for the above approach
#include <iostream>
#include <opencv2/opencv.hpp>
using namespace cv;
using namespace std;
  
// Driver code
int main(int argc, char** argv)
{
    // Read the image file as
    // imread("default.jpg");
    Mat image = imread("/home/edissonprieto/Documentos/Paralela y distribuida/Prácticas/Prueba/Grayscale/landscape.jpg");
  
    // Error Handling
    if (image.empty()) {
        cout << "Image File "
             << "Not Found" << endl;
  
        // wait for any key press
        cin.get();
        return -1;
    }

int pixel = 0;
    for(int y=0;y<image.rows;y++)
    {
        for(int x=0;x<image.cols;x++)
        {
        //Vec3b color = image.at<Vec3b>(Point(x,y));
        Vec3b intensity = image.at<Vec3b>(y, x);
         int blue = (int)intensity.val[0];
         int green = (int)intensity.val[1];
         int red = (int)intensity.val[2];

         int average = (int)((blue + green + red)/3);

        intensity.val[0] = average;
        intensity.val[1] = average;
        intensity.val[2] = average;

        image.at<Vec3b>(y, x) = intensity;
       /* if(color[0] > 150 && color[1] > 150 && color[2] > 150)
        {
            color[0] = 0;
            color[1] = 0;
            color[2] = 0;
            //cout << "Pixel >200 :" << x << "," << y << endl;
            Vec3b color = image.at<Vec3b>(Point(x,y));
        }
        else
        {
            color.val[0] = 255;
            color.val[1] = 255;
            color.val[2] = 255;
        }*/
    }
    }

    imwrite("newimage.jpg",image);
  
    // Show Image inside a window with
    // the name provided
   // imshow("Window Name", image);
  
    // Wait for any keystroke
    waitKey(0);
    return 0;
}
